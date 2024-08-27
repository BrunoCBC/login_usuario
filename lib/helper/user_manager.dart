import 'dart:async';
import 'package:asp_teste/core/errors/errors_messagens.dart';
import 'package:asp_teste/domain/entity/user.dart';
import 'package:asp_teste/core/errors/errors_classes.dart'; // Para erros personalizados

class UserManager {
  final List<User> _users = [];

  // Adiciona um novo usuário
  Future<void> addUser(User user) async {
    // Verifica se o usuário já existe
    if (_users.any((u) => u.username == user.username)) {
      throw UserAlreadyExistsError(MessagesError.emailAlreadyInUse);
    }
    _users.add(user);
  }

  // Obtém um usuário pelo nome de usuário
  Future<User?> getUserByUsername(String username) async {
    // Busca o usuário e lança um erro se não encontrado
    return _users.firstWhere(
      (user) => user.username == username,
      orElse: () => throw UserNotFoundError(MessagesError.userNotFound),
    );
  }

  // Verifica se a senha está correta
  Future<bool> verifyUser(String username, String password) async {
    try {
      final user = await getUserByUsername(username);
      return user?.password == password;
    } catch (e) {
      // Lança erro específico se o usuário não for encontrado
      throw e;
    }
  }
}