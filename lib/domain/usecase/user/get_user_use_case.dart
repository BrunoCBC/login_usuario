import 'package:asp_teste/presentarion/state/user_state.dart';

import '../../../datasource/user_repository_contract.dart';
import '../use_case_contract.dart';

class GetUserParams {
  final int userId;

  const GetUserParams({
    required this.userId,
  });
}

class GetUserUseCase implements IUseCase<UserState, GetUserParams> {
  final IUserRepository _repository;

  GetUserUseCase({
    required IUserRepository repository,
  }) : _repository = repository;

  @override
  Future<UserState> call(GetUserParams params) async {
    try {
      final user = await _repository.getUser(params.userId);
      return const SuccessState();
    } catch (e) {
      return ErrorState(e.toString());
    }
  }
}