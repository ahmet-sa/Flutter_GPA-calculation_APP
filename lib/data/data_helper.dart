import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../model/dersler.dart';

class DataHelper {
 static List<Ders> tumEklenenDersler=[];
 static  DersEkle(Ders ders){
  tumEklenenDersler.add(ders);
 }

  static List<String> _tumderslerinHarfleri() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  }

  static double _harfiNotaCevir(String harf) {
    switch (harf) {
      case 'AA':
        return 4.0;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3.0;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2.0;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1.0;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0.0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> tumderslerinHarfleri() {
    return _tumderslerinHarfleri()
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: _harfiNotaCevir(e),
            ))
        .toList();
  }

  static List<int> _tumKredilker() {
    return List.generate(10, (index) => (index + 1)).toList();
  }

  static List<DropdownMenuItem<double>> tumKredilker() {
    return _tumKredilker()
        .map(
          (e) => DropdownMenuItem(
            child: Text(e.toString()),
            value: e.toDouble(),
          ),
        )
        .toList();
  }


static double ortalamahesapla(){
  double toplamNot=0.0;
  double toplamKredi=0.0;


  tumEklenenDersler.forEach((element) { 
    toplamNot=toplamNot+(element.krediDegeri* element.harfDegeri);
    toplamKredi += element.krediDegeri;
    });
  
  return toplamNot / toplamKredi;

}
}
