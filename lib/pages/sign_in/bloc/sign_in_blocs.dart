import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_event.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_states.dart';
import 'package:email_validator/email_validator.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(): super (const SignInState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
    bool res = EmailValidator.validate(event.email) ? true : false;//"Please enter a valid email";
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  }

  @override
  Stream<SignInState> mapEventToState(EmailEvent event) async* {
    if (event is EmailEvent){
      print('event is EmailEvent');
      yield const SignInState(isBusy: true);

      if (EmailValidator.validate(event.email)) {
        yield const SignInState(emailError: FieldError.Empty);
        return;
      }

      if (!EmailValidator.validate(event.email)) {
        yield const SignInState(emailError: FieldError.Invalid);
        return;
      }

      yield const SignInState(submissionSuccess: true);
    }
  }
}