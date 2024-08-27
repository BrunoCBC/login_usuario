import 'package:asp_teste/datasource/user_repository_contract.dart';

import '../../domain/entity/user.dart';

class UserRepositoryImpl implements IUserRepository {
  final Map<String, User> _userDatabase = {}; // Simulação de banco de dados em memória
  int _nextId = 1; // Para gerar IDs únicos para novos usuários

  @override
  Future<User> getUser(int userId) async {
    final user = _userDatabase[userId.toString()];
    if (user == null) {
      throw Exception('Usuário com ID $userId não encontrado.');
    }
    return user;
  }

  @override
  Future<void> updateUser(User user) async {
    if (!_userDatabase.containsKey(user.id)) {
      throw Exception('Usuário com ID ${user.id} não encontrado para atualização.');
    }
    _userDatabase[user.id] = user;
  }

  @override
  Future<void> createUser(User user) async {
    if (_userDatabase.containsKey(user.id)) {
      throw Exception('Usuário com ID ${user.id} já existe.');
    }
    _userDatabase[user.id] = user;
  }

  @override
  Future<void> deleteUser(int userId) async {
    if (!_userDatabase.containsKey(userId.toString())) {
      throw Exception('Usuário com ID $userId não encontrado para exclusão.');
    }
    _userDatabase.remove(userId.toString());
  }

  Future<User> createUserAndReturn(User user) async {
    final newUser = user.copyWith(id: _nextId.toString());
    _nextId++;
    _userDatabase[newUser.id] = newUser;
    return newUser;
  }
}