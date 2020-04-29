
import 'dart:async';

import 'package:chimpu_edu_i/models/user.dart';
import 'package:chimpu_edu_i/repositories/base.dart';
class RemoteRepository implements BaseRepository {
  final Duration delay;

  const RemoteRepository([this.delay = const Duration(milliseconds: 3000)]);

  /// Mock that "fetches" some Todos from a "web service" after a short delay
  @override
  Future<List<User>> loadUsers() async {
    return Future.delayed(
        delay,
        () => [              
            ]);
  }

  /// Mock that returns true or false for success or failure. In this case,
  /// it will "Always Succeed"
  @override
  Future<bool> saveUsers(List<User> todos) async {
    return Future.value(true);
  }
}
