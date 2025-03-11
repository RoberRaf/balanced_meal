class ProductModel {
  late int id;
  String? foodName;
  int? calories;
  String? image;
  double? price;

  ProductModel({
    required this.id,
    this.foodName,
    this.calories,
    this.image,
    this.price,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    foodName = json['food_name'];
    calories = int.tryParse(json['calories'].toString());
    price = double.tryParse(json['price'].toString());
    image = json['image_url'];
  }
}
