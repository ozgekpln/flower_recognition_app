import 'dart:async';

import 'dart:core';

import 'package:flutter/services.dart';
/*
class Bitki1 {
  int id;
  String ad;

  Bitki1(this.id, this.ad);

  @override
  String toString() {
    return '$id $ad';
  }
}

Future<List<Bitki1>> dosyadanBitki1leriOku(String dosyaYolu) async {
  final file = File(dosyaYolu);

  try {
    final dosyaIcerik = await file.readAsString();
    final satirListesi = dosyaIcerik.split('\n');
    List<Bitki1>? Bitki1Listesi = [];

    for (var satir in satirListesi) {
      final parcalar = satir.split(' ');
      if (parcalar.length == 2) {
        final id = int.tryParse(parcalar[0]);
        if (id != null) {
          final bitki1 = Bitki1(id, parcalar[1]);
          Bitki1Listesi.add(bitki1);
        }
      }
    }

    return Bitki1Listesi;
  } catch (e) {
    print("Dosya okuma hatası: $e");
    return [];
  }
}
*/

class Cicek {
  String ad;

  Cicek(this.ad);

  static FutureOr<List<Cicek>> cicekListesiniGetir() async {
    final veriDosyasi = await rootBundle.loadString('assets/labels.txt');
    final satirlar = veriDosyasi.split('\n');

    final cicekler = satirlar.map((satir) => Cicek(satir)).toList();
    return cicekler;
  }
}
