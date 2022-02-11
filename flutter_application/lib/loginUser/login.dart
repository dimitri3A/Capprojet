import 'package:flutter_application/loginUser/signin.dart';
import 'package:flutter_application/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final controllerPassword = TextEditingController();
  final controllerEmail = TextEditingController();
  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Connexion",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                  Column(children: [
                    Container(
                      color: Colors.transparent,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        controller: controllerEmail,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                            hintText: "Votre email",
                            hintStyle: TextStyle(color: Colors.white),
                            labelText: "Email",
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            prefixIcon:
                                Icon(Icons.email_rounded, color: Colors.white),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      color: Colors.transparent,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        obscureText: true,
                        controller: controllerPassword,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                            hintText: "xxxxxxxx",
                            hintStyle: TextStyle(color: Colors.white),
                            labelText: "Mot de passe",
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            prefixIcon:
                                Icon(Icons.lock_rounded, color: Colors.white),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                    ),
                  ]),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: signIn,
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text("Se connecter"),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.login_rounded)
                            ],
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Pas de compte ?",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13)),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const Singin();
                                }));
                              },
                              child: const Text("s'inscrire"))
                        ],
                      )
                    ],
                  )
                ],
              ))),
    );
  }

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: controllerEmail.text.trim(),
          password: controllerPassword.text.trim());
    } on FirebaseAuthException catch (e) {
      Utilies.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
