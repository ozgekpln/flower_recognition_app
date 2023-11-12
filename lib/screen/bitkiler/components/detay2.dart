import 'package:flowers/sabit_degerler.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Bitki1 {
  final String commonName;
  final String scientificName;
  final List<String> otherNames;
  final String cycle;
  final String watering;
  final List<String> sunlight;

  Bitki1({
    required this.commonName,
    required this.scientificName,
    required this.otherNames,
    required this.cycle,
    required this.watering,
    required this.sunlight,
  });

  factory Bitki1.fromJson(Map<String, dynamic> json) {
    return Bitki1(
        commonName: json['common_name'] ?? '',
        scientificName: json['scientific_name'][0] ?? '',
        otherNames: (json['other_name'] as List<dynamic>)
            .map((e) => e.toString())
            .toList(),
        cycle: json['cycle'] ?? '',
        watering: json['watering'] ?? '',
        sunlight: (json['sunlight'] as List<dynamic>)
            .map((e) => e.toString())
            .toList());
  }
  static Future<List<Bitki1>> getBitkiBilgisi(String aranan) async {
    final response = await http.get(
      Uri.parse(
          'https://perenual.com/api/species-list?key=sk-x8o464f72ada8a8702086&q=$aranan'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> veri = jsonDecode(response.body)['data'];
      return veri.map((bitkiJson) => Bitki1.fromJson(bitkiJson)).toList();
    } else {
      throw Exception('Bitki verileri alınamadı.');
    }
  }
}

class Detay2 extends StatefulWidget {
  const Detay2({super.key, required this.bitkilistesi});
  final List<Bitki1> bitkilistesi;

  @override
  State<Detay2> createState() => _Detay2State();
}

class _Detay2State extends State<Detay2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bilgiler"),
        backgroundColor: renk1,
      ),
      body: ListView.builder(
        itemCount: widget.bitkilistesi.length,
        itemBuilder: (context, index) {
          final bitki = widget.bitkilistesi[index];
          return ListTile(
            title: Text(bitki.commonName),
            subtitle: Text(bitki.scientificName),
            onTap: () {
              // Bitkiye tıklanıldığında yapılacak işlemler
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(bitki.commonName),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Bilimsel Adlar: ${bitki.scientificName}'),
                        Text('Döngü: ${bitki.cycle}'),
                        Text('Sulama: ${bitki.watering}'),
                        Text('Güneş Işığı: ${bitki.sunlight.join(', ')}'),
                        if (bitki.otherNames != null)
                          Text('Diğer Adlar: ${bitki.otherNames.join(', ')}'),
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
