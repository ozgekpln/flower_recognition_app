import 'package:flowers/sabit_degerler.dart';
import 'package:flutter/material.dart';

class AramaKutusu extends StatelessWidget {
  const AramaKutusu({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.only(bottom: padding1),
        height: size.height * 0.2,
        //stack widgetleri üst üste eklerken kullanırız.
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: size.height / 6, bottom: size.height / 15),
              height: size.height * 0.2 - 27,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: padding1,
                        color: Colors.grey.withOpacity(0.33)),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  )),
            ),
            Center(
              child: SizedBox(
                width: 210,
                child: Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    decoration: const BoxDecoration(),
                    child: const Image(
                      image: AssetImage("assets/resimler/a6.png"),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(
                    horizontal: padding1,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: padding1,
                  ),
                  height: 54,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(padding1),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: padding1,
                            color: Colors.grey.withOpacity(0.33)),
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            hintText: "Bul",
                            hintStyle: TextStyle(color: renk1.withOpacity(0.5)),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      const Icon(Icons.search),
                    ],
                  ),
                ))
          ],
        ));
  }
}
