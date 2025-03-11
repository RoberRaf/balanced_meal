part 'enums_parser.dart';

enum Gender { male, female }

extension GenderNAme on Gender {
  String get name {
    switch (this) {
      case Gender.male:
        return "Male";
      case Gender.female:
        return "Female";
    }
  }
}
