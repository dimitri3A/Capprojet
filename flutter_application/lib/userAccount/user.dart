import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({Key? key}) : super(key: key);

  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text("Compte d'utilisateur"),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
                .collection("Users")
                .where('uid', isEqualTo: user.uid)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                    color: Colors.transparent,
                    height: MediaQuery.of(context).size.height,
                    child: const Center(child: CircularProgressIndicator()));
              } else if (snapshot.hasData) {
                return Column(
                  children: snapshot.data!.docs.map((e) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.person_rounded,
                                  size: 40, color: Colors.blue),
                              Container(
                                width: 280,
                                color: Colors.transparent,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Nom",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(e.get('nom'),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                          "Ce n'est pas votre code d'accès. Ce nom sera visible par vos Contacts sur VisioApp",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 12))
                                    ]),
                              )
                            ],
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.person_rounded,
                                  size: 40, color: Colors.blue),
                              Container(
                                width: 280,
                                color: Colors.transparent,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Prenom",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(e.get('prenom'),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                          "Ce n'est pas votre code d'accès. Ce prénom sera visible par vos Contacts sur VisioApp",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 12))
                                    ]),
                              )
                            ],
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.email_rounded,
                                  size: 40, color: Colors.blue),
                              Container(
                                width: 280,
                                color: Colors.transparent,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Email",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(e.get('email'),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                          "C'est votre email d'accès. Cet email sera visible par vos Contacts sur VisioApp",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 12))
                                    ]),
                              )
                            ],
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  }).toList(),
                );
              } else {
                return Container();
              }
            }),
      ),
    );
  }
}
