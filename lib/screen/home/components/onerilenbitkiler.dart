import 'package:flowers/sabit_degerler.dart';
import 'package:flowers/servis/auth_service.dart';
import 'package:flutter/material.dart';

// Dosyayı okuyan ve listeye dönüştüren fonksiyonu çağıran kod

class OnerilenBitkiler extends StatelessWidget {
  OnerilenBitkiler({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          OnerilenBitki(
            image: "assets/resimler/Daisy.jpg",
            isim: "Papatya",
            cins: "bitki",
            onPress: () {
              //print("object");
            },
          ),
          OnerilenBitki(
            image: "assets/resimler/Sunflower.jpg",
            isim: "Ayçiçeği",
            cins: "bitki",
            onPress: () {},
          ),
          OnerilenBitki(
            image: "assets/resimler/Rose.jpg",
            isim: "Gül",
            cins: "bitki",
            onPress: () {},
          ),
          OnerilenBitki(
            image: "assets/resimler/Tulip.jpg",
            isim: "lale",
            cins: "bitki",
            onPress: () {},
          ),
          OnerilenBitki(
            image: "assets/resimler/karahindiba.jpg",
            isim: "karahindiba",
            cins: "bitki",
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
/*
class OnerilenBitki extends StatelessWidget {
  const OnerilenBitki({
    Key? key,
    required this.image,
    required this.cins,
    required this.onPress,
    required this.isim,
  }) : super(key: key);

  final String image, isim, cins;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    bool isFavorite = false;

    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
        left: padding1,
        top: padding1 / 2,
        bottom: padding1,
      ),
      width: size.width * 0.4,
      child: Column(children: [
        Stack(
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(padding1 / 2),
                    topRight: Radius.circular(padding1 / 2)),
                child: AspectRatio(
                  aspectRatio: 9 / 7,
                  child: Image(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                )),
            Positioned(
                right: 0,
                child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: isFavorite ? Colors.red : Colors.white,
                  ),
                  onPressed: () {
                    isFavorite = !isFavorite;
                    isFavorite
                        ? authService.fav(isim)
                        : authService.unfav(isim);
                    authService.getfav();
                  },
                )),
            /* IconButton(
                  onPressed: () {
                    authService.fav(isim);
                  },
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 30,
                  ),
                ))
          */
          ],
        ),
        GestureDetector(
          onTap: onPress,
          child: Container(
              padding: const EdgeInsets.all(padding1 / 4),
              decoration: BoxDecoration(
                color: renk1.withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(padding1 / 2),
                    bottomRight: Radius.circular(padding1 / 2)),
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "$isim\n".toUpperCase(),
                          style: const TextStyle(color: Colors.black54)),
                      TextSpan(
                          text: cins.toUpperCase(),
                          style: const TextStyle(color: Colors.black26))
                    ]),
                  ),
                ],
              )),
        )
      ]),
    );
  }
}
*/

class OnerilenBitki extends StatefulWidget {
  const OnerilenBitki({
    Key? key,
    required this.image,
    required this.cins,
    required this.onPress,
    required this.isim,
  }) : super(key: key);

  final String image, isim, cins;
  final void Function()? onPress;

  @override
  _OnerilenBitkiState createState() => _OnerilenBitkiState();
}

class _OnerilenBitkiState extends State<OnerilenBitki> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
        left: padding1,
        top: padding1 / 2,
        bottom: padding1,
      ),
      width: size.width * 0.4,
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(padding1 / 2),
                  topRight: Radius.circular(padding1 / 2),
                ),
                child: AspectRatio(
                  aspectRatio: 9 / 7,
                  child: Image(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: isFavorite ? Colors.red : Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                    isFavorite
                        ? authService.fav(widget.isim)
                        : authService.unfav(widget.isim);
                    authService.getfav();
                  },
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: widget.onPress,
            child: Container(
              padding: const EdgeInsets.all(padding1 / 4),
              decoration: BoxDecoration(
                color: renk1.withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(padding1 / 2),
                  bottomRight: Radius.circular(padding1 / 2),
                ),
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "${widget.isim}\n".toUpperCase(),
                        style: const TextStyle(color: Colors.black54),
                      ),
                      TextSpan(
                        text: widget.cins.toUpperCase(),
                        style: const TextStyle(color: Colors.black26),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
