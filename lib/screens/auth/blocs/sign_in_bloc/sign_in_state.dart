part of 'sign_in_bloc.dart';

sealed class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object?> get props => [];
}

final class SignInInitial extends SignInState {}

final class SignUpFailure extends SignInState {}
final class SignUpLoading extends SignInState {}
final class SignUpSuccess extends SignInState {}


