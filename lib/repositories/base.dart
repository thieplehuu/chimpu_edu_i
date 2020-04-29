
import 'dart:async';
import 'dart:core';

import 'package:chimpu_edu_i/models/user.dart';

abstract class BaseRepository {
  Future<List<User>> loadUsers();
  Future saveUsers(List<User> users);
}
