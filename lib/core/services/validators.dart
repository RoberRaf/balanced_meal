
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
}
