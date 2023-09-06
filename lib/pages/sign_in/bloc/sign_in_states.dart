class SignInState {
  final String email;
  final String password;

  final bool isBusy;
  final FieldError? emailError;
  final bool submissionSuccess;

  const SignInState({
    this.email = '',
    this.password = '',
    this.isBusy = false,
    this.emailError,
    this.submissionSuccess = false
  });

  SignInState copyWith({String? email, String? password}) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password
    );
  }
}

enum FieldError { Empty, Invalid }