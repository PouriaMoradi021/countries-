import 'package:countries/features/feature-login/presention/bloc/users_bloc.dart';
import 'package:countries/features/feature-login/presention/screens/validator.dart';
import 'package:countries/features/feature_countries/presention/screens/main_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Validator validation;
  TextEditingController emailController = TextEditingController();
  late String email;


  @override
  void initState() {
    BlocProvider.of<UsersBloc>(context);
    validation = Validator();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    validation.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<UsersBloc, UsersState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff2D9596),
              title: const Text('Login Page'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  StreamBuilder(
                    builder: ((context, snapshot) =>
                        TextField(
                          controller: emailController,
                          onChanged: validation.sinkEmail,
                          decoration: InputDecoration(
                            hintText: 'Email Address',

                            errorText:
                            snapshot.error as String?,
                          ),
                        )),
                    stream: validation.email,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  StreamBuilder(
                    builder: ((context, snapshot) =>
                        TextField(
                          onChanged: validation.sinkPassword,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            errorText:
                            snapshot.error as String?,
                          ),
                        )),
                    stream: validation.password,
                  ),
                  StreamBuilder(
                      stream: validation.loginValid,

                      builder: (context, snapshot) {
                        return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                disabledBackgroundColor: Colors.grey,
                                backgroundColor: snapshot.data != true
                                    ? Colors.grey[200]
                                    : Colors.red),
                            onPressed: snapshot.hasData &&
                                snapshot.data == true ? ()
                        {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => const MainWrapper()));
                          BlocProvider.of<UsersBloc>(context).add(
                              LoadUsersEvent(emailController.text));
                        } : null,
                        child: const Text('Login')
                        ,
                        );


                      }

                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

