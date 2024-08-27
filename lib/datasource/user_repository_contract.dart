import '../domain/entity/user.dart';

abstract class IUserRepository {
  Future<User> getUser(int userId);
  Future<void> updateUser(User user);
  Future<void> createUser(User user);
  Future<void> deleteUser(int userId);
}