import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository _userRepository;

  SignInBloc(this._userRepository) : super(SignInInitial()) {
    on<SignInReuired>((event, emit) async {
      emit(SignUpLoading());
      try {
        await _userRepository.signIn(event.email, event.password);
      } catch (e) {
        emit(SignUpFailure());
      }
    });

    on<SignOutRequired>((event, emit) async => await _userRepository.logOut());
  }
}
