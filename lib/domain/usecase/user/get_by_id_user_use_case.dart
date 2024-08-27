import 'package:asp_teste/domain/usecase/user/get_user_use_case.dart';
import 'package:asp_teste/presentarion/state/user_state.dart';

import '../../../datasource/user_repository_contract.dart';
import '../use_case_contract.dart';

class GetUserUseCaseImpl implements IUseCase<UserState, GetUserParams> {
  final IUserRepository _repository;

  GetUserUseCaseImpl({
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
