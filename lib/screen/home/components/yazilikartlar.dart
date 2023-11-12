import 'package:flowers/sabit_degerler.dart';
import 'package:flowers/screen/k%C4%B1lavuz/nas%C4%B1l_cal%C4%B1s%C4%B1r.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class yaziliKartlar extends StatelessWidget {
  const yaziliKartlar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          UstuYaziliFoto(
              yazi: "Başlarken...",
              image: "assets/resimler/baslangıc.jpg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Basla()),
                );
              }),
          UstuYaziliFoto(
            yazi: "Haftanın Bitkisi",
            image: "assets/resimler/pembe.jpg",
            press: () {},
          ),
          UstuYaziliFoto(
            yazi: "Favoriler",
            image: "assets/resimler/sarı.jpg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class UstuYaziliFoto extends StatelessWidget {
  const UstuYaziliFoto({
    Key? key,
    required this.yazi,
    required this.press,
    required this.image,
  }) : super(key: key);
  final String yazi, image;
  final void Function()? press;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(children: [
      GestureDetector(
        onTap: press,
        child: Container(
          margin: const EdgeInsets.only(
            left: padding1,
            top: padding1 / 2,
          ),
          width: size.width * 0.8,
          height: 170.0,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(padding1 / 4)),
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(
            vertical: 140.0, horizontal: padding1 * 1.2),
        child: Text(
          yazi,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
    ]);
  }
}
