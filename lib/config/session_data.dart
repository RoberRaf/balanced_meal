import 'package:flutterflow_task/features/user_info_form/data/user_info_model.dart';

class SessionData {
  SessionData._();
  static final _inst = SessionData._();
  static SessionData get inst => _inst;

  final userInfo = UserInfoModel();
}
