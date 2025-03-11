class AppRegex {
  static final RegExp emailValidatorRegExp = RegExp(r"^01[0125][0-9]{8}$");
}

class Validators {
  static String? notEmpty(String? value, {String? msg}) {
    if (value == null || value.isEmpty) {
      return msg ?? "This field can't be empty";
    }
    return null;
  }

  static String? withinRange(String? value, int min, int max, {String? msg}) {
    if (value == null || value.isEmpty) {
      return msg ?? "This field can't be empty";
    }
    if (int.tryParse(value) == null) {
      return "This field must be a number";
    }
    if (int.parse(value) < min || int.parse(value) > max) {
      return msg ?? "This field must be between $min and $max";
    }
    return null;
  }
}
