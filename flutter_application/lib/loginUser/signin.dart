import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/loginUser/login.dart';
import 'package:flutter_application/main.dart';
import 'package:flutter_application/utils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Singin extends StatefulWidget {
  const Singin({Key? key}) : super(key: key);

  @override
  _SinginState createState() => _SinginState();
}

class _SinginState extends State<Singin> {
  final controllerName = TextEditingController();
  final controllerFirstname = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerPasswordConfirm = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerPasswordConfirm.dispose();
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
          body: SingleChildScrollView(
            child: Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text("Inscription",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                    Form(
                      key: formKey,
                      child: Column(children: [
                        Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: controllerName,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.white,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (nom) => nom != null && nom.length < 4
                                ? 'au moins 4 caractères pour le nom'
                                : null,
                            decoration: const InputDecoration(
                                hintText: "Votre Nom",
                                hintStyle: TextStyle(color: Colors.white),
                                labelText: "Nom",
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                prefixIcon: Icon(Icons.person_rounded,
                                    color: Colors.white),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: controllerFirstname,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.white,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (prenom) =>
                                prenom != null && prenom.length < 4
                                    ? 'au moins 4 caractères pour le prenom'
                                    : null,
                            decoration: const InputDecoration(
                                hintText: "Votre prénom",
                                hintStyle: TextStyle(color: Colors.white),
                                labelText: "Prénom",
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                prefixIcon: Icon(Icons.person_rounded,
                                    color: Colors.white),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: controllerEmail,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.white,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (email) =>
                                email != null && !EmailValidator.validate(email)
                                    ? 'Email non correct'
                                    : null,
                            decoration: const InputDecoration(
                                hintText: "Votre email",
                                hintStyle: TextStyle(color: Colors.white),
                                labelText: "Email",
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                prefixIcon: Icon(Icons.email_rounded,
                                    color: Colors.white),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            obscureText: true,
                            controller: controllerPassword,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.white,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) => value != null &&
                                    value.length < 6
                                ? 'Le mot de passe doit contenir au moins 6 caractères'
                                : null,
                            decoration: const InputDecoration(
                                hintText: "xxxxxxxx",
                                hintStyle: TextStyle(color: Colors.white),
                                labelText: "Mot de passe",
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                prefixIcon: Icon(Icons.lock_rounded,
                                    color: Colors.white),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            obscureText: true,
                            controller: controllerPasswordConfirm,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.white,
                            decoration: const InputDecoration(
                                hintText: "confirmez votre mot de passe",
                                hintStyle: TextStyle(color: Colors.white),
                                labelText: "Confirmez mot de passe",
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                prefixIcon: Icon(Icons.lock_rounded,
                                    color: Colors.white),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: signUp,
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text("S'inscrire"),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.check_rounded)
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
                            const Text("Vous avez déja un compte ?",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13)),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const Login();
                                  }));
                                },
                                child: const Text("se connecter"))
                          ],
                        )
                      ],
                    )
                  ],
                )),
          )),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: controllerEmail.text.trim(),
          password: controllerPassword.text.trim());
      final user = FirebaseAuth.instance.currentUser!;
      Map<String, dynamic> userData = {
        "uid": user.uid,
        "nom": controllerName.text,
        "prenom": controllerFirstname.text,
        "email": user.email,
        "profil": "",
      };
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(user.uid)
          .set(userData, SetOptions(merge: true));
    } on FirebaseAuthException catch (e) {
      Utilies.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
