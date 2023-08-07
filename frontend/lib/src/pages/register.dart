import 'package:flutter/material.dart';
import 'package:frontend/src/generated/user.pbgrpc.dart';
import 'package:frontend/src/pages/login.dart';
import 'package:frontend/src/statics.dart';
import 'package:frontend/src/utils/colors.dart';

class PageRegister extends StatefulWidget {
  const PageRegister({Key? key}) : super(key: key);

  @override
  _PageRegisterState createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  late UserServiceClient _stub;
  final _formKey = GlobalKey<FormState>();
  final User user = User();
  String secondPassword = '';

  @override
  void initState() {
    _stub = UserServiceClient(Connection.channel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: foregroundColor,
    );

    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Register')),
        ),
        backgroundColor: scaffoldBackground,
        body: Stack(
          children: [
            Center(
              child: Container(
                width: 500,
                color: textBackgroundColor,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.person),
                        title: TextFormField(
                          style: textStyle,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            labelStyle: textStyle,
                          ),
                          onFieldSubmitted: (value) {
                            setState(() {
                              user.name = value;
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              user.name = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.person_outline_rounded),
                        title: TextFormField(
                          style: textStyle,
                          decoration: const InputDecoration(
                            labelText: 'Lastname',
                            labelStyle: textStyle,
                          ),
                          onFieldSubmitted: (value) {
                            setState(() {
                              user.lastname = value;
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              user.lastname = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.email),
                        title: TextFormField(
                          style: textStyle,
                          decoration: const InputDecoration(
                            labelText: 'E-Mail',
                            labelStyle: textStyle,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (value) {
                            setState(() {
                              user.email = value;
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              user.email = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.password),
                        title: TextFormField(
                          style: textStyle,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            labelStyle: textStyle,
                          ),
                          obscureText: true,
                          onFieldSubmitted: (value) {
                            setState(() {
                              user.password = value;
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              user.password = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.repeat),
                        title: TextFormField(
                          style: textStyle,
                          decoration: const InputDecoration(
                            labelText: 'Repeat Password',
                            labelStyle: textStyle,
                          ),
                          obscureText: true,
                          onFieldSubmitted: (value) {
                            setState(() {
                              secondPassword = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else if (value != user.password) {
                              return 'Passwords dont match';
                            }
                            return null;
                          },
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50)
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            register();
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
  
  void register() async {
    try {
      RegisterResult result = await _stub.register(user);
      if (mounted) {
        if (result.result) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('User registered sucessfully')));
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PageAuth()));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('User could not be registered')));
        }
      }
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
    
  }
}