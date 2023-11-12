import 'package:flowers/sabit_degerler.dart';
import 'package:flutter/material.dart';

class PlantDetailPage extends StatelessWidget {
  final Map<String, dynamic> plant;

  PlantDetailPage({required this.plant});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          plant["common_name"],
          style: TextStyle(color: siyah),
        ),
        backgroundColor: Colors.black12,
      ),
      body: Column(
        children: [
          Image.network(plant["default_image"]["regular_url"]),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                    child: Text(
                        "Bilimsel Adı: ${plant["scientific_name"].join(", ")}")),
                Text("Diğer Adlar: ${plant["other_name"].join(", ")}"),
                Text("Yaşam Döngüsü: ${plant["cycle"]}"),
                Text("Sulama Gereksinimi: ${plant["watering"]}"),
                Text("Güneş Gereksinimi: ${plant["sunlight"].join(", ")}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
