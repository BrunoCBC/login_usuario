// create_user_use_case.dart
import 'package:asp_teste/datasource/user_repository_contract.dart';
import 'package:asp_teste/domain/entity/user.dart';
import 'package:asp_teste/domain/usecase/use_case_contract.dart';
import 'package:asp_teste/presentarion/state/user_state.dart';

class CreateUserParams {
  final User user;

  const CreateUserParams({
    required this.user,
  });
}

class CreateUserUseCase implements IUseCase<UserState, CreateUserParams> {
  final IUserRepository _repository;

  CreateUserUseCase({
    required IUserRepository repository,
  }) : _repository = repository;

  @override
  Future<UserState> call(CreateUserParams params) async {
    try {
      await _repository.createUser(params.user);
      return const SuccessState();
    } catch (e) {
      return ErrorState(e.toString());
    }
  }
}
