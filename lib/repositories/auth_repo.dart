import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  static Future<Either<String, UserCredential>> login(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(e.message ?? '');
    }
  }

  static Future<Either<String, UserCredential>> signUp(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(e.message ?? '');
    }
  }
}
