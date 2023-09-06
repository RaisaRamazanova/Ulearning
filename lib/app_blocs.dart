import 'package:ulearning_app/app_events.dart';
import 'package:ulearning_app/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends Bloc<AppEvents, AppStates> {
  AppBlocs(): super(InitStates()){

    on<Increment>((event, ask) {
      ask(AppStates(counter: state.counter + 1));
    });
  }
}