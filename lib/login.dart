import 'package:facebook_login/facebook_login.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Facebook Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left:20, top: 50),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => FacebookLogin()
            ));
          },
          child: const Text('Sign in with Facebook'),
        ),
      ),

    );
  }
}
