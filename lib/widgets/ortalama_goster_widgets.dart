import 'package:flutter/material.dart';
import 'package:ortalamahesaplamauygulama/constanst/constants.dart';

class OrtalamGoster extends StatelessWidget {
 
  final double ortalama;
  final int dersSayisi; 
 const OrtalamGoster({required this.dersSayisi,required this.ortalama ,super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(dersSayisi >0 ? '$dersSayisi ders girildi ':"ders seciniz",style: Sabitler.dersSayisiStyle,),
        Text(ortalama>=0 ? '${ortalama.toStringAsFixed(2)}' : "0.0",style: Sabitler.OrtalamaStyle),
        Text("Ortalama",
        style: Sabitler.dersSayisiStyle,),
      ],
    );
  }
}