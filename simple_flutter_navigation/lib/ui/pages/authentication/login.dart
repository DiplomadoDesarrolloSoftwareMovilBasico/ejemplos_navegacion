import 'package:flutter/material.dart';
import 'package:simple_flutter_navigation/ui/pages/content/home.dart';

import 'signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Login Page (simple navigation)",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your user',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_textController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                content: Text('Value can not be empty')));
                          } else {
                            final name = _textController.text;
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage(name: name)),
                            );
                          }
                        },
                        child: Text("Login")),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()),
                          );
                        },
                        child: Text("Create user")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
