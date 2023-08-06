import 'package:flutter/material.dart';
import 'package:frontend/src/statics.dart';
import 'package:frontend/src/generated/user.pbgrpc.dart';


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
      backgroundColor: Colors.cyan,
      body: Card(
        color: Colors.purple,
        child: Padding(
          padding: EdgeInsets.only(bottom: 24, left: 24, right: 24, top: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => setState(() => email = value),
                decoration: const InputDecoration(
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
              const SizedBox(height: 12,),
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
                    decoration: const InputDecoration(
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
    );
  }
  
  void login() async {
    Values.token = await _stub.login(LoginParams(email: email, password: password));
  }
}



