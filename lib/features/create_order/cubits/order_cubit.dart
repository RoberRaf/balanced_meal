import 'package:flutter/material.dart' show Colors;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_task/config/session_data.dart';
import 'package:flutterflow_task/features/create_order/cubits/order_states.dart';
import 'package:flutterflow_task/features/create_order/data/models/cart_item.dart';
import 'package:flutterflow_task/features/create_order/data/models/order_request.dart';
import 'package:flutterflow_task/features/create_order/data/repo/order_repo.dart';

class OrderCubit extends Cubit<OrderStates> {
  OrderCubit() : super(OrderInitialState());
  final cartItems = <CartItem>[];

  void addCartItem(CartItem cartItem) {
    final index = cartItems.indexWhere((e) => e.id == cartItem.id);
    if (index != -1) {
      // this item is exist
      cartItems[index].quantity += cartItem.quantity;
    } else {
      // new item to cart
      cartItems.add(cartItem);
    }
    emit(UpdateItemState(cartItem.id));
    calculateTotalCalories();
    calculateTotalPrice();
    updateCalColor();
  }

  void removeCartItem(int id) {
    final index = cartItems.indexWhere((e) => e.id == id);
    if (index != -1) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        cartItems.removeAt(index);
      }
      emit(UpdateItemState(id));
      calculateTotalCalories();
      calculateTotalPrice();
      updateCalColor();
    }
  }

  bool itemQtyChange(int id, bool isIncreament) {
    final index = cartItems.indexWhere((e) => e.id == id);
    if (index != -1) {
      if (isIncreament) {
        cartItems[index].quantity++;
      } else {
        if (cartItems[index].quantity > 1) {
          cartItems[index].quantity--;
        } else {
          cartItems.removeAt(index);
        }
      }
      emit(UpdateItemState(id));
      calculateTotalCalories();
      calculateTotalPrice();
      updateCalColor();
      return true;
    }
    return false;
  }

  int totalCal = 0;
  int calculateTotalCalories() {
    totalCal = cartItems.fold(0, (previousValue, e) => previousValue + (e.totalCalories()));
    emit(CaloriesUpdatedState(totalCal));
    return totalCal;
  }

  double calculateTotalPrice() {
    final price = cartItems.fold(0.0, (previousValue, e) => previousValue + (e.totalPrice()));
    emit(PriceUpdatedState(price));
    return price;
  }

  void updateCalColor() {
    final calRatio = selectedCalRatio();
    if (calRatio > 1.1) return emit(ColorUpdatedState(Colors.red));
    if (calRatio > 0.9) return emit(ColorUpdatedState(Colors.green));
    if (calRatio > 0.45) return emit(ColorUpdatedState(Colors.yellow));
    return emit(ColorUpdatedState(Colors.grey));
  }

  double selectedCalRatio() {
    return totalCal / SessionData.inst.userInfo.calculateCalorites();
  }

  void craeteOrder() async {
    emit(OrderCreateLoadingState());
    final res = await OrderRepo.createOrder(OrderRequest(cartItems: cartItems));
    if (res) {
      emit(OrderCreateSuccessState());
    } else {
      emit(OrderCreateFailureState("Failed to create order"));
    }
  }
}
