// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:chimpu_edu_i/models/user.dart';
import 'package:chimpu_edu_i/repositories/base.dart';

/// Loads and saves a List of Todos using a text file stored on the device.
///
/// Note: This class has no direct dependencies on any Flutter dependencies.
/// Instead, the `getDirectory` method should be injected. This allows for
/// testing.
class FileStorage implements BaseRepository {
  final String tag;
  final Future<Directory> Function() getDirectory;

  const FileStorage(
    this.tag,
    this.getDirectory,
  );

  @override
  Future<List<User>> loadUsers() async {
    final file = await _getLocalFile();
    final string = await file.readAsString();
    final json = JsonDecoder().convert(string);
    final todos = (json['todos'])
        .map<User>((user) => User.fromJson(user))
        .toList();

    return todos;
  }

  @override
  Future<File> saveUsers(List<User> users) async {
    final file = await _getLocalFile();

    return file.writeAsString(JsonEncoder().convert({
      'todos': users.map((user) => user.toJson()).toList(),
    }));
  }

  Future<File> _getLocalFile() async {
    final dir = await getDirectory();

    return File('${dir.path}/ArchSampleStorage__$tag.json');
  }

  Future<FileSystemEntity> clean() async {
    final file = await _getLocalFile();

    return file.delete();
  }
}
