// // import 'package:path_provider/path_provider.dart';

// import 'dart:io';

// import 'package:isar/isar.dart';

// class IsarServices {
//   late Future<Isar> db;
//   int? currentUserID;
//   IsarServices() {
//     db = openDB();
//   }

// // // ***************** CartItems  ***************************

// //   Future<List<DBCartItem>> getAllCartItems() async {
// //     final isar = await db;
// //     final cartItems = await isar.dBCartItems.where().findAll();
// //     return cartItems;
// //   }

// //   Future<List<int>> addCartManyProducts(List<CartProduct> items) async {
// //     final isar = await db;
// //     final prods = <DBCartItem>[];
// //     for (final item in items) {
// //       final prod = DBCartItem.fromCartProduct(item);
// //       prods.add(prod);
// //     }
// //     // await isar.writeTxn(() => isar.dealItems.clear());
// //     return isar.writeTxnSync<List<int>>(() => isar.dBCartItems.putAllSync(prods));
// //   }

// //   Future<int> addCartProduct(CartProduct neCartItem) async {
// //     final isar = await db;
// //     final prod = DBCartItem.fromCartProduct(neCartItem);
// //     // await isar.writeTxn(() => isar.dealItems.clear());
// //     return isar.writeTxnSync<int>(() => isar.dBCartItems.putSync(prod));
// //   }

// //   Future<void> removeCartItems(int itemId) async {
// //     final isar = await db;
// //     await isar.writeTxn(
// //       () => isar.dBCartItems.delete(itemId),
// //     );
// //   }

// //   Future<void> clearAllCartItems() async {
// //     final isar = await db;
// //     await isar.writeTxn(() => isar.dBCartItems.clear());
// //   }

// //   Future<void> adjustCartItemsNote({required int itemId, String? note}) async {
// //     final isar = await db;
// //     final item = await isar.dBCartItems.get(itemId);
// //     item?.note = note;
// //     await isar.writeTxn(() => isar.dBCartItems.put(item!));
// //   }

// // // ***************** DeliveryOption  ***************************
// //   Future<DeliveryOptionModel?> getDeliveryOption() async {
// //     final isar = await db;
// //     final option = await isar.deliveryOptionModels.where().findFirst();
// //     return option;
// //   }

// //   Future<int> saveOption(DeliveryOptionModel option) async {
// //     final isar = await db;
// //     return isar.writeTxnSync<int>(() => isar.deliveryOptionModels.putSync(option));
// //   }

// // //  ****************** favorite functions ******************

// //   Future<List<FavortieModel>> getAllFavorites() async {
// //     final isar = await db;
// //     return await isar.favortieModels.where().findAll();
// //   }

// //   Future<int> saveFavorite(FavortieModel favorite) async {
// //     final isar = await db;
// //     return isar.writeTxnSync<int>(() => isar.favortieModels.putSync(favorite));
// //   }

// //   Future<bool> removeFavorite(int id) async {
// //     final isar = await db;
// //     return await isar.writeTxn(() => isar.favortieModels.filter().idEqualTo(id).deleteFirst());
// //   }

// //   Future<void> removeAllFavorite() async {
// //     final isar = await db;
// //     await isar.writeTxn(
// //       () => isar.favortieModels.clear(),
// //     );
// //   }

// // ***************** DataBase open *****************
//   Future<Isar> openDB() async {
//     if (Isar.instanceNames.isEmpty) {
//       return await Isar.open([], directory: Directory.systemTemp.path, inspector: true);
//     }
//     return Future.value(Isar.getInstance());
//   }
// }
