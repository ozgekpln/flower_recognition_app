import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flowers/sabit_degerler.dart';
import 'package:flowers/screen/home/components/onerilenbitkiler.dart';
import 'package:flowers/screen/home/components/yazilikartlar.dart';
import 'package:flowers/servis/auth_service.dart';
import 'package:flutter/material.dart';

class Favori extends StatefulWidget {
  const Favori({super.key});

  @override
  State<Favori> createState() => _FavoriState();
}

class _FavoriState extends State<Favori> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Favoriler"),
        ),
        backgroundColor: renk1.withOpacity(.6),
      ),
      body: Center(
        child: SizedBox(
          width: size.width * .7,
          child: Container(
            child: ListView.builder(
              itemCount: authService.favs.length,
              itemBuilder: (context, position) {
                return Card(
                  child: Center(
                    child: OnerilenBitki(
                        cins: 'bitki',
                        isim: authService.favs[position],
                        onPress: () {},
                        image:
                            "assets/resimler/${authService.favs[position]}.jpg"),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
