import '../../../datasource/user_repository_contract.dart';
import '../../../presentarion/state/user_state.dart';
import '../../entity/user.dart';
import '../use_case_contract.dart';

class UpdateUserParams {
  final User user;

  const UpdateUserParams({
    required this.user,
  });
}

class UpdateUserUseCaseImpl implements IUseCase<UserState, UpdateUserParams> {
  final IUserRepository _repository;

  UpdateUserUseCaseImpl({
    required IUserRepository repository,
  }) : _repository = repository;

  @override
  Future<UserState> call(UpdateUserParams params) async {
    try {
      await _repository.updateUser(params.user);
      return const SuccessState();
    } catch (e) {
      return ErrorState(e.toString());
    }
  }
}
