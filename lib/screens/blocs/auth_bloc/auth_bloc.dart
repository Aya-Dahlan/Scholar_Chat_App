import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {

    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoading());

        try {
          UserCredential user = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: event.email, password: event.pass);

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
    });
  }

@override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    // TODO: implement 
    super.onTransition(transition);
    print(transition);
  }
}
