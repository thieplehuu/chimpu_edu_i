import 'package:chimpu_edu_i/data/model/children.dart';
import 'package:flutter/foundation.dart';

abstract class ChildrensRepository {
  /// Loads todos first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the Todos from a Web Client.
  Future<List<Children>> loadChildrens();

  // Persists todos to local disk and the web
  Future saveChildrens(List<Children> childrens);
}

class RemoteRepository implements ChildrensRepository {
  final ChildrensRepository localStorage;
  final ChildrensRepository webClient;

  const RemoteRepository({
    @required this.localStorage,
    this.webClient = const WebClient(),
  });

  /// Loads todos first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the Todos from a Web Client.
  @override
  Future<List<TodoEntity>> loadTodos() async {
    try {
      return await localStorage.loadTodos();
    } catch (e) {
      final todos = await webClient.loadTodos();

      await localStorage.saveTodos(todos);

      return todos;
    }
  }

  // Persists todos to local disk and the web
  @override
  Future saveTodos(List<TodoEntity> todos) {
    return Future.wait<dynamic>([
      localStorage.saveTodos(todos),
      webClient.saveTodos(todos),
    ]);
  }
}