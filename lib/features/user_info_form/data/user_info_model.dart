import 'package:flutterflow_task/core/extensions/enums.dart';

class UserInfoModel {
  Gender? gender;
  int? weight;
  int? height;
  int? age;

  UserInfoModel({
    this.gender,
    this.weight,
    this.height,
    this.age,
  });

  bool isValid() {
    return gender != null && weight != null && height != null && age != null;
  }

  int calculateCalorites() {
    if (!isValid()) return 0;
    switch (gender!) {
      case Gender.male:
        return (666.47 + (13.75 * weight!) + (5 * height!) - (6.75 * age!)).ceil();
      case Gender.female:
        return (655.1 + (9.56 * weight!) + (1.85 * height!) - (4.67 * age!)).ceil();
    }
  }
}
