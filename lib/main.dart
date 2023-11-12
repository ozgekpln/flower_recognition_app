import 'package:flowers/screen/k%C4%B1lavuz/nas%C4%B1l_cal%C4%B1s%C4%B1r.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
//import 'package:flutter_tflite/flutter_tflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

/*void main() async {
  try {
    final bitkiAdi = 'monstera'; // Sorgulamak istediğiniz bitkinin adı
    final bitkiBilgisi = await Plant().getBitkiBilgisi(bitkiAdi);

    // Bitki bilgilerini kullanma
    print('Bitki Adı: ${bitkiBilgisi['data'][0]['common_name']}');
    print('Açıklama: ${bitkiBilgisi['data'][0]['scientific_name']}');
    print('Açıklama: ${bitkiBilgisi['data'][0]['id']}');

    // Diğer bilgileri de burada kullanabilirsiniz

  } catch (e) {
    print('Hata: $e');
  }
}
*/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Çiçek',
      home: Basla(),
    );
  }
}

/*class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        tooltip: "Pick Image",
        child: const Icon(Icons.image),
      ),
    );
  }

  Future pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    File image = File(pickedFile!.path);
    imageClassification(image);
  }
}*/
