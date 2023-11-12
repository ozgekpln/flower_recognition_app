import 'package:flowers/sabit_degerler.dart';
import 'package:flowers/screen/home/components/butonluBasl%C4%B1k.dart';
import 'package:flowers/screen/kamera/components/kamera.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
/*
class Deneme extends StatefulWidget {
  const Deneme({super.key});

  @override
  State<Deneme> createState() => _DenemeState();
}*/
/*
class _DenemeState extends State<Deneme> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bitkiVerileriniCek();
  }

  @override
  List<Bitki> bitkiListesi = [];
  void _bitkiVerileriniCek() async {
    try {
      final veriler = await getBitkiBilgisi("Sunflower");
      setState(() {
        bitkiListesi = veriler; // Verileri listeye atayın.
      });
    } catch (e) {
      // Hata durumlarını ele almak için bir şeyler yapabilirsiniz.
      print('Hata: $e');
    }
  }

  FutureOr<List<Bitki>> getBitkiBilgisi(String Aranan) async {
    final response = await http.get(
      Uri.parse(
          'https://perenual.com/api/species-list?key=sk-x8o464f72ada8a8702086&q=$Aranan'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> veri = jsonDecode(response.body)['data'];
      return veri.map((bitkiJson) => Bitki.fromJson(bitkiJson)).toList();
    } else {
      throw Exception('Bitki verileri alınamadı.');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: bitkiListesi.length,
        itemBuilder: (context, index) {
          final bitki = bitkiListesi[index];
          return ListTile(
            //leading: Image.network(bitki.resimURL!),
            title: Text(bitki.commonName),
            subtitle: Text(bitki.scientificName),
            onTap: () {
              // Bitkiye tıklanıldığında yapılacak işlemler
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(bitki.otherNames.first),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Bilimsel Adlar: ${bitki.scientificName}'),
                        Text('Döngü: ${bitki.cycle}'),
                        Text('Sulama: ${bitki.watering}'),
                        Text('Güneş Işığı: ${bitki.sunlight.join(', ')}'),
                        if (bitki.otherNames != null)
                          Text('Diğer Adlar: ${bitki.otherNames!.join(', ')}'),
                        //Text('Lisans Adı: ${bitki.lisansAdi}'),
                        TextButton(
                          onPressed: () {
                            // Lisans URL'sine gitmek için bir işlev
                            //launchUrlString(bitki.lisansURL);
                          },
                          child: Text('Lisans Bilgileri'),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Kapat'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
*/

/*class Plant {
  Future<Map<String, dynamic>> getBitkiBilgisi(String arananBitki) async {
    final response = await http.get(
      Uri.parse(
          'https://perenual.com/api/species-list?key=sk-x8o464f72ada8a8702086&q=$arananBitki'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Bitki bilgisi alınamadı.');
    }
  }
}*/

class Tanim extends StatefulWidget {
  const Tanim(
      {super.key,
      required this.image,
      required this.imageSelect,
      required this.result});
  final File image;
  final bool imageSelect;
  final List<dynamic> result;

  @override
  State<Tanim> createState() => _TanimState();
}

class _TanimState extends State<Tanim> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Image.file(widget.image),
            ),
          ),
          SingleChildScrollView(
            child: Column(
                children: (widget.imageSelect)
                    ? []
                    : widget.result.map(
                        (result) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: SizedBox(
                              height: size.height,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: size.height * .11,
                                    width: size.width * .98,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: renk1.withOpacity(.2),
                                      ),
                                      margin: const EdgeInsets.all(20),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          top: 10,
                                          left: 10,
                                        ),
                                        child: Text(
                                          "${result['label']} - ${result['confidence'].toStringAsFixed(2)}",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ButtonluBaslik(
                                      title: "Açıklama", press: () {}),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: size.height * .2,
                                      child: Container(
                                        margin: const EdgeInsets.all(8),
                                        decoration:
                                            const BoxDecoration(color: renk1),
                                        child: Text(""),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconluKutu(
                                        size: size,
                                        text:
                                            "", // Örnek olarak bitki adını alın
                                        icon: Icons.water_drop,
                                        renk: Colors.black45,
                                      ),
                                      IconluKutu(
                                        size: size,
                                        text: "",
                                        icon: Icons.sunny,
                                        renk: Colors.black45,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ).toList()),
          )
        ]),
      ),
    );
  }
}
