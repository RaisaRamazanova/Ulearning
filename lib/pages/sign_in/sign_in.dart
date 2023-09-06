import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widget.dart';

import 'bloc/sign_in_event.dart';
import 'bloc/sign_in_states.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          if (state.isBusy) {
            return const CircularProgressIndicator();
          }
          return Container(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: buildAppBar(),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildThirdPartyLogin(context),
                      Center(child: reusableText("Or use your email account to login")),
                      Container(
                        margin: EdgeInsets.only(top: 36.h),
                        padding: EdgeInsets.only(left: 25.w, right: 25.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reusableText("Email"),
                            SizedBox(height: 5.h,),
                            buildTextField(_hasEmailError(state), 'Enter your email address', 'email', 'user',
                              (value) {
                                context.read<SignInBloc>().add(EmailEvent(value));
                              }
                            ),
                            reusableText("Password"),
                            SizedBox(height: 5.h,),
                            buildTextField(true, 'Enter your password address', 'password', 'lock',
                                (value) {
                              context.read<SignInBloc>().add(PasswordEvent(value));
                              }
                            ),
                            if (_hasEmailError(state)) ...[
                              SizedBox(height: 5),
                              Text(
                                _emailErrorText(state.emailError!),
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ],
                        ),
                      ),
                      forgotPassword(),
                      buildLogInAndReqButton('Log in', 'login'),
                      buildLogInAndReqButton('Register', 'register')
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  bool _hasEmailError(SignInState state) => state.emailError != null;

  String _emailErrorText(FieldError error) {
    switch (error) {
      case FieldError.Empty:
        return 'You need to enter an email address';
      case FieldError.Invalid:
        return 'Email address invalid';
      default:
        return '';
    }
  }
}
