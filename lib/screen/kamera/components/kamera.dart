import 'dart:io';
import 'package:flowers/sabit_degerler.dart';
import 'package:flowers/screen/home/components/butonluBasl%C4%B1k.dart';
import 'package:flowers/screen/kamera/components/tanimlama.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class Kamera extends StatefulWidget {
  const Kamera({super.key});

  @override
  State<Kamera> createState() => _KameraState();
}

class _KameraState extends State<Kamera> {
  @override
  void initState() {
    super.initState();
    loadModel();
    //_bitkiVerileriniCek();
  }

  //List<Bitki> bitkiListesi = [];
  /*Future<Bitki> getBitkiBilgisi(String bitkiAdi) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://perenual.com/api/species-list?key=sk-x8o464f72ada8a8702086&q=$bitkiAdi'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> veri = jsonDecode(response.body)['data'];
        if (veri.isNotEmpty) {
          // İlk eşleşen bitkiyi alın.
          return Bitki.fromJson(veri[0]);
        } else {
          throw Exception('Bitki bulunamadı.');
        }
      } else {
        throw Exception('Bitki verileri alınamadı.');
      }
    } catch (e) {
      // Hata durumlarını ele almak için bir şeyler yapabilirsiniz.
      print('Hata: $e');
      rethrow; // Hata yine fırlatılır.
    }
  }
*/
  late File _image;
  late List _results;
  bool imageSelect = true;
  loadModel() async {
    Tflite.close();
    String res1;
    res1 = (await Tflite.loadModel(
        model: "assets/model.tflite", labels: "assets/labels.txt"))!;
    print("Models loading status: $res1");
  }

  imageClassification(File image) async {
    final List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results = recognitions!;
      _image = image;
      imageSelect = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: (imageSelect)
          ? GestureDetector(
              onTap: (() {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Center(
                          child: Text(
                            'Seçiniz!',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                        actions: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 60),
                            child: TextButton(
                              onPressed: () {
                                pickImage(ImageSource.camera);
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                size: 50,
                                color: renk1,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: TextButton(
                              onPressed: () {
                                pickImage(ImageSource.gallery);
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.photo,
                                size: 50,
                                color: renk1,
                              ),
                            ),
                          ),
                        ],
                      );
                    });
                // Navigator.pop(context);
              }),
              child: Stack(
                children: [
                  const Positioned(
                    top: 50,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [],
                    ),
                  ),
                  Positioned(
                    top: 100,
                    right: 20,
                    left: 20,
                    child: Container(
                      width: size.width * 0.8,
                      height: size.height * 0.8,
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.document_scanner_rounded,
                              color: Colors.grey.shade600,
                              size: 100,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Taramak İçin Tıklayınız.",
                              style: TextStyle(
                                color: Colors.grey.withOpacity(0.7),
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Tanim(image: _image, imageSelect: imageSelect, result: _results),
    );
  }

  void pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: source,
    );
    File image = File(pickedFile!.path);
    imageClassification(image);
  }
}

class IconluKutu extends StatelessWidget {
  const IconluKutu({
    Key? key,
    required this.size,
    required this.text,
    required this.icon,
    required this.renk,
  }) : super(key: key);

  final Size size;
  final String text;
  final IconData icon;
  final Color renk;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: size.width * .45,
              height: size.height * .2,
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: renk1.withOpacity(.3),
                        offset: const Offset(8, 8),
                        spreadRadius: 5, // Gölgenin yayılma miktarı
                        blurRadius: 10, // Gölgenin bulanıklık miktarı
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
        ),
        Positioned(
          left: 70,
          top: 30,
          child: Icon(icon, size: 50, color: renk, semanticLabel: text),
        ),
        Positioned(
            left: 70,
            top: 80,
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ))
      ],
    );
  }
}



/*class Kamera extends StatefulWidget {
  const Kamera({super.key});

  @override
  State<Kamera> createState() => _KameraState();
}

class _KameraState extends State<Kamera> {
  late File _image;
  late List _results;
  bool imageSelect = false;
  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future loadModel() async {
    Tflite.close();
    String res;
    res = (await Tflite.loadModel(
        model: "assets/model.tflite", labels: "assets/labels.txt"))!;
    print("Models loading status: $res");
  }

  Future imageClassification(File image) async {
    final List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results = recognitions!;
      _image = image;
      imageSelect = true;
    });
  }

  double get height => MediaQuery.of(context).size.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          (imageSelect)
              ? Container(
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: EdgeInsets.only(top: height / 10),
                    child: SizedBox(child: Image.file(_image)),
                  ),
                )
              : Center(
                  child: Container(
                    decoration: BoxDecoration(),
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 3),
                      child: SizedBox(
                        child: Opacity(
                          opacity: 0.8,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Fotoğraf seç',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: height / 30,
                                      color: Colors.black38),
                                ),
                                Icon(
                                  Icons.photo,
                                  size: height / 10,
                                  color: Colors.black26,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          SingleChildScrollView(
            child: Column(
              children: (imageSelect)
                  ? _results.map((result) {
                      return Card(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "${result['label']} ",
                            style: const TextStyle(
                                color: Colors.red, fontSize: 26),
                          ),
                        ),
                      );
                    }).toList()
                  : [],
            ),
          )
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(),
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () => pickImage(ImageSource.gallery),
                tooltip: "Pick Image",
                child: const Icon(Icons.image),
                backgroundColor: renk1,
              ),
              FloatingActionButton(
                onPressed: () => pickImage(ImageSource.camera),
                tooltip: "Pick Image",
                child: const Icon(Icons.camera_alt),
                backgroundColor: renk1,
              ),
              FloatingActionButton(
                onPressed: () => null,
                tooltip: "Pick Image",
                child: const Icon(Icons.question_mark),
                backgroundColor: renk1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: source,
    );
    File image = File(pickedFile!.path);
    imageClassification(image);
  }
}
*/
/*
SingleChildScrollView(
            child: Column(
              children: (imageSelect)
                  ? _results.map((result) {
                      return Card(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "${result['label']} - ${result['confidence'].toStringAsFixed(2)}",
                            style: const TextStyle(
                                color: Colors.red, fontSize: 20),
                          ),
                        ),
                      );
                    }).toList()
                  : [],
            ),
          )
*/
