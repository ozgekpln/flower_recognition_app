import 'package:flowers/aray%C3%BCz/root_page.dart';
import 'package:flowers/sabit_degerler.dart';
import 'package:flowers/screen/bitkiler/components/cicekler.dart';
import 'package:flowers/screen/bitkiler/components/detay2.dart';
import 'package:flowers/screen/home/components/onerilenbitkiler.dart';
import 'package:flutter/material.dart';
import 'dart:core';

import 'package:page_transition/page_transition.dart';

class Cicek1 extends StatefulWidget {
  const Cicek1({super.key});

  @override
  State<Cicek1> createState() => _CicekState();
}

class _CicekState extends State<Cicek1> {
  List<Cicek> cicekListesi = [];
  @override
  void initState() {
    super.initState();
    _verileriYukle();
  }

  void _verileriYukle() async {
    final cicekler = await Cicek.cicekListesiniGetir();

    setState(() {
      cicekListesi = cicekler;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: const RootPage(),
                        type: PageTransitionType.bottomToTop));
              },
              icon: const Icon(Icons.arrow_back_ios),
              color: siyah,
            ),
            SizedBox(
              width: 100,
            ),
            const Text(
              "Bitkiler",
              textAlign: TextAlign.center,
              style: TextStyle(color: siyah),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: size.width * .96,
        child: Container(
          margin: const EdgeInsets.only(top: 10, right: 5),
          decoration: const BoxDecoration(color: Colors.white),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 18, mainAxisSpacing: 20),

              //padding: EdgeInsetsGeometry.infinity,
              itemCount: cicekListesi.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: OnerilenBitki(
                    image: "assets/resimler/${cicekListesi[index].ad}.jpg",
                    isim: cicekListesi[index].ad,
                    cins: "Bitki",
                    onPress: () async {
                      final bitki =
                          await Bitki1.getBitkiBilgisi(cicekListesi[index].ad);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Detay2(
                              bitkilistesi:
                                  bitki), // Tıklanan bitkiyi ayrıntı sayfasına iletiyoruz
                        ),
                      );
                    },
                  ),
                );
              }),
        ),
      ),
    );
  }
}
