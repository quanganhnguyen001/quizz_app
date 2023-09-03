import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  checkAuthentication() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      emit(Authenticated(user));
    } else {
      emit(UnAuthenticated());
    }
  }

  login(User? user) {
    emit(Authenticated(user!));
  }

  logout() async {
    await FirebaseAuth.instance.signOut();
    emit(UnAuthenticated());
  }
}
