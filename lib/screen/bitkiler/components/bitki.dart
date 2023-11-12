import 'package:flowers/sabit_degerler.dart';
import 'package:flowers/screen/bitkiler/components/detay.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Bitki extends StatefulWidget {
  const Bitki({
    super.key,
  });

  @override
  State<Bitki> createState() => _BitkiState();
}

Future<List<Map<String, dynamic>>> fetchData() async {
  final response = await http.get(
    Uri.parse(
        "https://perenual.com/api/species-list?key=sk-x8o464f72ada8a8702086"),
  );

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body)["data"];
    return data.cast<Map<String, dynamic>>();
  } else {
    throw Exception('Failed to load data');
  }
}

class _BitkiState extends State<Bitki> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bitkiler",
          style: TextStyle(color: siyah),
        ),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Hata: ${snapshot.error}');
          } else {
            final data = snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Tıklama işlemi
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PlantDetailPage(
                            plant: data[
                                index]), // Tıklanan bitkiyi ayrıntı sayfasına iletiyoruz
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(data[index]["common_name"]),
                    subtitle: Text(data[index]["scientific_name"].join(", ")),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
