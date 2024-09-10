import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'Animation/FadeAnimation.dart';
import 'package:avoid_it/signup.dart';
import 'package:avoid_it/Components/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return; // User canceled the sign-in
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Show success notification
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Google sign-in successful!'),
          backgroundColor: Colors.green,
        ),
      );

      // Navigate to HomePage after successful sign-in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      // Show error notification
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Google sign-in failed: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        await FirebaseAuth.instance.signInWithCredential(credential);

        // Show success notification
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Facebook sign-in successful!'),
            backgroundColor: Colors.green,
          ),
        );

        // Navigate to HomePage after successful sign-in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        // Show error notification
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Facebook sign-in failed: ${result.status}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      // Show error notification
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Facebook sign-in failed: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    FocusNode fnemail = FocusNode();
    FocusNode fnpwd = FocusNode();

    return Scaffold(
      appBar: AppBar(
        title: Text("Avoid It"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: FadeAnimation(
                    1, // delay in seconds
                    Text(
                      "Sign In",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                elevation: 10,
                shadowColor: Colors.black,
                borderRadius: BorderRadius.circular(22),
                child: FadeAnimation(
                  1.2, // delay in seconds
                  TextFormField(
                    controller: _emailController,
                    focusNode: fnemail,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (value) {
                      fnemail.unfocus();
                      FocusScope.of(context).requestFocus(fnpwd);
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Username or email",
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Material(
                elevation: 10,
                shadowColor: Colors.black,
                borderRadius: BorderRadius.circular(22),
                child: FadeAnimation(
                  1.3, // delay in seconds
                  TextFormField(
                    controller: _passwordController,
                    focusNode: fnpwd,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Material(
                shadowColor: Colors.purpleAccent,
                elevation: 10,
                color: Colors.purple,
                borderRadius: BorderRadius.circular(28),
                child: FadeAnimation(
                  1.5, // delay in seconds
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 49, vertical: 14),
                    color: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                        );

                        // Show success notification
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Sign-in successful!'),
                            backgroundColor: Colors.green,
                          ),
                        );

                        // Navigate to HomePage
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      } on FirebaseAuthException catch (e) {
                        // Show error notification
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(e.message ?? 'Sign-in failed'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Or login with",
                style: TextStyle(color: Colors.black38),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      child: RawMaterialButton(
                        padding: EdgeInsets.all(10),
                        elevation: 10,
                        fillColor: Colors.white70,
                        shape: CircleBorder(),
                        child: Image.asset("fonts/google_icon2.png"),
                        onPressed: _signInWithGoogle,
                      ),
                    ),
                    SizedBox(width: 20),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      child: RawMaterialButton(
                        padding: EdgeInsets.all(10),
                        elevation: 10,
                        fillColor: Colors.white70,
                        shape: CircleBorder(),
                        child: Image.asset("fonts/facebook.png"),
                        onPressed: _signInWithFacebook,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
                child: FadeAnimation(
                  1.8, // delay in seconds
                  Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
