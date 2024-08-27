sealed class UserState {
  const UserState();
  
  factory UserState.success() = SuccessState;
  factory UserState.failure(String message) = ErrorState;
}

final class SuccessState implements UserState {
  const SuccessState();
}

final class ErrorState implements UserState {
  const ErrorState(this.message);
  final String message;
}
