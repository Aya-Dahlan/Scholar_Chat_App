import 'package:bloc/bloc.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

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
}
