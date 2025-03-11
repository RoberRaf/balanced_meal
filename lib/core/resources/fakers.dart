
import 'package:flutterflow_task/features/create_order/data/models/product_model.dart';

class Fakers {
 Fakers._();
 static List<ProductModel> get fakeProducts => List.generate(4, (index) {
    return ProductModel(
      id: index,
      foodName: 'Product $index',
      calories: 10*(index+1),
      image: 'https://www.mashed.com/img/gallery/the-truth-about-lean-beef/l-intro-1621886574.jpg',
    );
 },);
}
