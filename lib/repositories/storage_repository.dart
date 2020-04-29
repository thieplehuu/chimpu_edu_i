// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';
import 'dart:core';

import 'package:chimpu_edu_i/models/user.dart';
import 'package:chimpu_edu_i/repositories/base.dart';
import 'package:chimpu_edu_i/repositories/remote_repository.dart';
import 'package:meta/meta.dart';

/// A class that glues together our local file storage and web client. It has a
/// clear responsibility: Load Todos and Persist todos.
class StorageRepository implements BaseRepository {
  final BaseRepository localStorage;
  final BaseRepository webClient;

  const StorageRepository({
    @required this.localStorage,
    this.webClient = const RemoteRepository(),
  });

  /// Loads todos first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the Todos from a Web Client.
  @override
  Future<List<User>> loadUsers() async {
    try {
      return await localStorage.loadUsers();
    } catch (e) {
      final todos = await webClient.loadUsers();

      await localStorage.saveUsers(todos);

      return todos;
    }
  }

  // Persists todos to local disk and the web
  @override
  Future saveUsers(List<User> users) {
    return Future.wait<dynamic>([
      localStorage.saveUsers(users),
      webClient.saveUsers(users),
    ]);
  }
}
