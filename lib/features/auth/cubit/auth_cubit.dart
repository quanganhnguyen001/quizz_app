// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitial());

  checkAuthentication() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      emit(Authenticated(user));
    } else {
      emit(const UnAuthenticated());
    }
  }

  login(User? user) {
    emit(Authenticated(user!));
  }

  logout() async {
    await FirebaseAuth.instance.signOut();
    emit(const UnAuthenticated());
  }
}
