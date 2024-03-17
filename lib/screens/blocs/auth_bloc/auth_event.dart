part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email; 
  final String pass;
  LoginEvent({required this.email, required this.pass});
}

class RegisterEvent extends AuthEvent {}
