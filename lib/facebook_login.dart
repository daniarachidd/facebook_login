import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'home.dart';

class FacebookLogin extends StatefulWidget {
  const FacebookLogin({Key? key}) : super(key: key);

  @override
  State<FacebookLogin> createState() => _FacebookLoginState();
}

class _FacebookLoginState extends State<FacebookLogin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Facebook Login'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Center(
            child: ElevatedButton(
                onPressed: (){
                  signInWithFacebook();
                  setState(() {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Home())
                    );
                  });
                },
                child: Text('Log in'),
            ),
          ),


        ],
      )

    );
  }


  Future<UserCredential> signInWithFacebook() async {

    final LoginResult loginResult = await FacebookAuth.instance.login(
      permissions: [
        'email', 'public_profile', 'user_birthday'
      ]
    );

    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
