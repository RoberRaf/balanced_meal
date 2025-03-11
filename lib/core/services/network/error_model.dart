class ErrorModel {
  String? message;
  List<String>? errors;

  ErrorModel({this.message, this.errors});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];

    if (json['errors'] != null) {
      final errors = json['errors'] as Map<String, dynamic>;
      final List<String> errosList = [];
      for (var e in errors.values) {
        if (e is List<dynamic>) {
          errosList.addAll(e.map((e) => e));
        }
      }
      this.errors = errosList;
    }
  }
}
