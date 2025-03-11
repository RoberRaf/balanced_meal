import 'dart:ui';

abstract class OrderStates {}

class OrderInitialState extends OrderStates {}

class OrderCreateLoadingState extends OrderStates {}

class OrderCreateSuccessState extends OrderStates {}

class OrderCreateFailureState extends OrderStates {
  final String error;

  OrderCreateFailureState(this.error);
}

class UpdateItemState extends OrderStates {
  final int id;

  UpdateItemState(this.id);
}

class CaloriesUpdatedState extends OrderStates {
  final int calories;

  CaloriesUpdatedState(this.calories);
}

class PriceUpdatedState extends OrderStates {
  final double price;

  PriceUpdatedState(this.price);
}

class ColorUpdatedState extends OrderStates {
  final Color color;

  ColorUpdatedState(this.color);
}
