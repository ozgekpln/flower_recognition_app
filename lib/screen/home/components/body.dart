import 'package:flowers/screen/bitkiler/components/bitki_liste.dart';
import 'package:flowers/screen/home/components/aramaKutusu.dart';
import 'package:flowers/screen/home/components/butonluBasl%C4%B1k.dart';
import 'package:flowers/screen/home/components/onerilenbitkiler.dart';
import 'package:flowers/screen/home/components/yazilikartlar.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          AramaKutusu(size: size),
          ButtonluBaslik(
            title: "Bitkiler",
            press: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const Cicek1()));
            },
          ),
          //BitkiListesiWidget(),
          OnerilenBitkiler(),
          ButtonluBaslik(title: "Nasıl Çalışır", press: () {}),
          const yaziliKartlar()
        ],
      ),
    );
  }
}
