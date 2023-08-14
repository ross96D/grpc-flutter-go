import 'package:flutter/material.dart';
import 'package:frontend/src/pages/home.dart';
import 'package:frontend/src/pages/register.dart';
import 'package:frontend/src/statics.dart';
import 'package:frontend/src/generated/user.pbgrpc.dart';
import 'package:frontend/src/utils/animations.dart';
import 'package:frontend/src/utils/colors.dart';

final passwordFocusNode = FocusNode();

class PageAuth extends StatefulWidget {
  const PageAuth({Key? key}) : super(key: key);

  @override
  _PageAuthState createState() => _PageAuthState();
}

class _PageAuthState extends State<PageAuth> {
  late UserServiceClient _stub;
  String? email;
  String? password;

  @override
  void initState() {
    _stub = UserServiceClient(Connection.channel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MColor.scaffoldBackground,
        body: Stack(
          children: [
            Positioned(
              top: 5.0,
              right: 5.0,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => MColor.textBackgroundColor)
                ),
                onPressed: register,
                child: const Text("Registrarte", style: TextStyle(color: MColor.foregroundColor)),
              ),
            ),
            Center(
              child: Card(
                color: const Color.fromARGB(255, 6, 46, 73),
                child: Container(
                  width: 306+48.0,
                  padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24, top: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) => setState(() => email = value),
                        style: const TextStyle(
                          color: MColor.foregroundColor
                        ),
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(
                            color: MColor.foregroundColor
                          ),
                          labelText: "Email",
                          contentPadding: EdgeInsets.only(
                            right: 0,
                            left: 0,
                            bottom: 8,
                            top: 12,
                          ),
                        ),
                        onFieldSubmitted: (value) {
                          if (email != null) {
                            passwordFocusNode.requestFocus();
                          }
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Stack(
                        children: [
                          TextFormField(
                            focusNode: passwordFocusNode,
                            obscureText: true,
                            onChanged: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                            style: const TextStyle(
                              color: MColor.foregroundColor
                            ),
                            decoration: const InputDecoration(
                              labelStyle: TextStyle(
                                color: MColor.foregroundColor
                              ),
                              labelText: "Contraseña",
                              contentPadding: EdgeInsets.only(right: 40, left: 0, bottom: 8, top: 12),
                            ),
                            onFieldSubmitted: (value) {
                              if (email != null && password != null) {
                                login();
                              }
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  void login() async {
    Authorization.token = await _stub.login(LoginParams(email: email, password: password));
    if (mounted) {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return DefaultTransition(
              primaryAnimation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
        )
      );
    }
  }

  void register() async {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const PageRegister(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return DefaultTransition(
            primaryAnimation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
      )
    );
  }
}
