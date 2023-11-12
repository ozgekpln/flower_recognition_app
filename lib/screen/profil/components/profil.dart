import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowers/sabit_degerler.dart';
import 'package:flowers/screen/profil/components/girisekrani.dart';
import 'package:flowers/screen/profil/components/profilwidget.dart';
import 'package:flowers/screen/profil/components/sifre.dart';
import 'package:flowers/servis/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _kullanici =
      FirebaseFirestore.instance.collection('Kullanici');

  User? get currentUser => _auth.currentUser;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //User? user = currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Profil",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder(
        stream:
            _kullanici.where('mail', isEqualTo: currentUser!.email).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey.shade500.withOpacity(.9),
                          width: 3,
                        )),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.grey.withOpacity(.7),
                      child: const Icon(
                        Icons.person,
                        size: 90,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: SizedBox(
                      width: size.width * .9,
                      child: Padding(
                        padding: const EdgeInsets.only(),
                        child: ListTile(
                          title: Text(
                            documentSnapshot['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            documentSnapshot['mail'].toString(),
                          ),
                          trailing: SizedBox(
                            width: 100,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      height: size.height * .4,
                      width: size.width * .88,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          profilWidget(
                            icon: Icons.person,
                            title: "Profil",
                          ),
                          GestureDetector(
                            onTap: (() {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ChangePasswordScreen()),
                              );
                            }),
                            child: profilWidget(
                              icon: Icons.settings,
                              title: "Ayarlar",
                            ),
                          ),
                          profilWidget(
                            icon: Icons.notifications,
                            title: "Bildirim",
                          ),
                          GestureDetector(
                            onTap: () {
                              authService.signOut();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Giris()),
                              );
                            },
                            child: profilWidget(
                              icon: Icons.logout,
                              title: "Çıkış",
                            ),
                          ),
                        ],
                      ))
                ]);
              },
            );
          }

          return const Center(
            child:
                CircularProgressIndicator(), //veri yüklenene kadar bekleme süresinde görünmesi için
          );
        },
      ),
    );
  }
}
/*
class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Kullanici');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['name']}");
        }

        return Text("loading");
      },
    );
  }
}
*/
