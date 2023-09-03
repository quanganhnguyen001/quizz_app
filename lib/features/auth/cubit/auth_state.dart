part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  AuthInitial();

  @override
  List<Object?> get props => [];
}

class UnAuthenticated extends AuthState {
  UnAuthenticated();

  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthState {
  final User user;

  Authenticated(this.user);

  @override
  List<Object?> get props => [user];
}
