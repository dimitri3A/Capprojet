import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Historique"),
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection("Historique").get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    children: snapshot.data!.docs.map((e) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Container(
                              color: Colors.transparent,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.topCenter,
                                    height: 300,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(e.get('url')))),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(e.get('time')),
                                  Text(e.get('date')),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      e.get('type') == "1"
                                          ? const Icon(Icons.circle,
                                              color: Colors.red)
                                          : const Icon(Icons.circle,
                                              color: Colors.green),
                                      e.get('type') == "1"
                                          ? const Text("Appel manqué")
                                          : const Text("Appel recu")
                                    ],
                                  )
                                ],
                              )),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
            } else {
              return Container(
                color: Colors.transparent,
                height: MediaQuery.of(context).size.height,
                child: const Center(child: CircularProgressIndicator()),
              );
            }
          }),
    );
  }
}
