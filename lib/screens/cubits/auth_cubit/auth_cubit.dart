import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthCubitInitial());
  Future<void> loginUser({required String email, required String pass}) async {
    emit(LoginLoading());

    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);

      emit(LoginSuccess());

      
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {

        emit(LoginFailure(errorMessage: 'User not found'));
      } else if (ex.code == 'wrong-password') {
        emit(LoginFailure(errorMessage: 'Wrong password'));
      }
    } on Exception catch (e) {
      emit(LoginFailure(errorMessage: 'something went wrong'));
    }
  }

  
  Future<void> registerUser(
      {required String email, required String pass}) async {
    emit(RegisterLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(RegisterFailure(
          errorMessage: 'The password provided is to weak.',
        ));
      } else if (ex.code == 'email-already-in-use') {
        emit(RegisterFailure(
            errorMessage: 'The account already exists for that email.'));
      }
    } on Exception catch (e) {
      emit(RegisterFailure(errorMessage: 'Something when wrong'));
    }
  }
}
