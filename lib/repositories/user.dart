import 'dart:async';

import 'package:chimpu_edu_i/models/user.dart';

abstract class UserRepository {
  Future<User> login();
}
