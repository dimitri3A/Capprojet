import 'package:avatar_glow/avatar_glow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/setting/settingscreen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const SettingScreen();
                  }));
                },
                icon: const Icon(Icons.menu_rounded)),
            centerTitle: true,
            title: const Text("Visio App", style: TextStyle()),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: 300,
                          color: Colors.black,
                          child: const Center(child: Text("VisioApp")),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              "Lorsqu'un appel est en cours un bouton apparaitra en bas. Veuillez appuyez dessus pour décrocher l'appel",
                              textAlign: TextAlign.center),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              color: Colors.black,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("00:00:00",
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Live')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SingleChildScrollView(
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            color: Colors.transparent,
                            child: Center(
                              child: Column(
                                children: snapshot.data!.docs.map((e) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("Vous avez un appel entrant...",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      GestureDetector(
                                        onTap: () async {
                                          final url = e.get('url');

                                          if (await canLaunch(url)) {
                                            await launch(url,
                                                forceWebView: true,
                                                enableJavaScript: true);
                                          }
                                        },
                                        child: const AvatarGlow(
                                          endRadius: 50,
                                          glowColor: Colors.red,
                                          child: CircleAvatar(
                                              backgroundColor: Colors.green,
                                              radius: 20,
                                              child: Icon(Icons.phone_in_talk,
                                                  color: Colors.white)),
                                        ),
                                      )
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Container(
                            color: Colors.transparent,
                            height: MediaQuery.of(context).size.height,
                            child: const Center(
                                child: CircularProgressIndicator()));
                      }
                    }),
              ],
            ),
          )),
    );
  }
}
