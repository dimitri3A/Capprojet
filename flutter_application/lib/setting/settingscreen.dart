import 'package:flutter_application/historique/history.dart';
import 'package:flutter_application/userAccount/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const HistoryScreen();
              }));
            },
            child: const ListTile(
              leading: CircleAvatar(
                radius: 20,
                child: Icon(Icons.backup_sharp),
              ),
              title: Text("Historique"),
              subtitle: Text("consultez la liste des appels"),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const UserAccount();
              }));
            },
            child: const ListTile(
              leading: CircleAvatar(
                radius: 20,
                child: Icon(Icons.person_rounded),
              ),
              title: Text("Utilisateur"),
              subtitle: Text("votre compte et données personnelles"),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const ListTile(
              leading: CircleAvatar(
                radius: 20,
                child: Icon(Icons.settings_rounded),
              ),
              title: Text("Réglages"),
              subtitle: Text("accedez aux different paramètres"),
            ),
          ),
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
            child: const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 20,
                child: Icon(Icons.logout_rounded, color: Colors.white),
              ),
              title: Text("Déconnexion"),
              subtitle: Text("déconnecter votre compte de cet appareil"),
            ),
          ),
        ],
      ),
    );
  }
}
