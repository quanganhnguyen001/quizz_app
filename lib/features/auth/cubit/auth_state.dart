part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class UnAuthenticated extends AuthState {
  UnAuthenticated();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Authenticated extends AuthState {
  final User user;

  Authenticated(this.user);

  @override
  List<Object?> get props => [user];
}
