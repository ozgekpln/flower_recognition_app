import 'package:flowers/aray%C3%BCz/root_page.dart';
import 'package:flowers/sabit_degerler.dart';
import 'package:flowers/screen/profil/components/girisekrani.dart';
import 'package:flutter/material.dart';

class Basla extends StatefulWidget {
  const Basla({super.key});

  @override
  State<Basla> createState() => _BaslaState();
}

class _BaslaState extends State<Basla> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: padding1, top: padding1),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const RootPage()),
                );
              },
              child: Text(
                "Atla",
                style: TextStyle(
                  color: renk1.withOpacity(0.5),
                  fontSize: padding1 * 1.1,
                ),
              ), //anasayfaya git.
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              BaslaSayfasi(
                image: "assets/resimler/cicek-cizimi-5.jpg",
                tittle: "Çiçeklerin dünyasına girmeye hazır mısınız?",
                aciklama: "Başlayalım",
                renk: renk1,
              ),
              BaslaSayfasi(
                image: "assets/resimler/cicek-cizimi-8.jpg",
                tittle: "Çiçeklerin dünyasına girmeye hazır mısınız?",
                aciklama: "Başlayalım",
                renk: renk1,
              ),
              BaslaSayfasi(
                image: "assets/resimler/cicek-cizimi-15.jpg",
                tittle: "Çiçeklerin dünyasına girmeye hazır mısınız?",
                aciklama: "Başlayalım",
                renk: renk1,
              ),
            ],
          ),
          Positioned(
              bottom: 80,
              left: 30,
              child: Row(
                children: _gosterge(),
              )),
          Positioned(
            bottom: 60,
            right: 30,
            child: Container(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (currentIndex < 2) {
                      currentIndex++;
                      if (currentIndex < 3) {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      }
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const Giris()),
                      );
                    }
                  });
                },
                icon: const Icon(Icons.arrow_forward_ios_rounded,
                    size: 24, color: renk1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget gosterge(bool aktifMi) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10,
      width: aktifMi ? 20 : 8,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: renk1,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _gosterge() {
    List<Widget> gostegeler = [];

    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        gostegeler.add(gosterge(true));
      } else {
        gostegeler.add(gosterge(false));
      }
    }
    return gostegeler;
  }
}

class BaslaSayfasi extends StatelessWidget {
  const BaslaSayfasi({
    Key? key,
    required this.image,
    required this.tittle,
    required this.aciklama,
    required this.renk,
  }) : super(key: key);
  final String image, tittle, aciklama;
  final Color renk;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
        child: Column(
          children: [
            SizedBox(
              height: 350,
              child: Image.asset(image),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              tittle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: renk,
                  fontSize: padding1 * 1.5,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              aciklama,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: padding1, color: Colors.grey),
            ),
          ],
        ));
  }
}
