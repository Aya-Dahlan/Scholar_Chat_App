import 'package:chat_app/constans.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/screens/blocs/auth_bloc/auth_bloc.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatelessWidget {
  bool isLoading = false;

  static String id = 'loginScreen';

  GlobalKey<FormState> formKey = GlobalKey();
  String? email, pass;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is LoginLoading){
          isLoading= true;
        }
        else if(state is LoginSuccess){
          BlocProvider.of<ChatCubit>(context).getMessages();
          Navigator.pushNamed(context, ChatScreen.id, arguments: email);


        }

        else if (state is LoginFailure){
          showSnackBar(context, state.errorMessage);


        }
      },
      builder:(context , state)=> ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 75,
                  ),
                  Image.asset(
                    'assets/images/scholar.png',
                    height: 100,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Scholar Chat",
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'pacifico',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                      onChanged: (data) {
                        email = data;
                      },
                      hintText: 'Email'),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    obscureText: true,
                    hintText: 'Password',
                    onChanged: (data) {
                      pass = data;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    text: 'LOGIN',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>
                        (context).add(LoginEvent(email: email!, pass: pass!));
                      } else {}
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Dont\'t have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterScreen.id);
                        },
                        child: const Text(
                          '  Register',
                          style: TextStyle(
                            color: Color(0xffC7EDE6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
