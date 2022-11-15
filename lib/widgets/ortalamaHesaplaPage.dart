import 'package:flutter/material.dart';
import 'package:ortalamahesaplamauygulama/constanst/constants.dart';
import 'package:ortalamahesaplamauygulama/data/data_helper.dart';
import 'package:ortalamahesaplamauygulama/model/dersler.dart';
import 'package:ortalamahesaplamauygulama/widgets/ders_listesi.dart';
import 'package:ortalamahesaplamauygulama/widgets/ortalama_goster_widgets.dart';

class OrtalamaHesaplamaPage extends StatefulWidget {
  OrtalamaHesaplamaPage({super.key});

  @override
  State<OrtalamaHesaplamaPage> createState() => _OrtalamaHesaplamaPageState();
}

class _OrtalamaHesaplamaPageState extends State<OrtalamaHesaplamaPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenDeger = 4;
  double secilenkredi = 1;
  String girilendersadi = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            Sabitler.baslik,
            style: Sabitler.baslikStyle,
          ),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: _buildForm(),
            ),
            Expanded(
              flex: 1,
              child: OrtalamGoster(
                  dersSayisi: DataHelper.tumEklenenDersler.length,
                  ortalama: DataHelper.ortalamahesapla()),
            )
          ],
        ),
        Expanded(child: DersListesi(
        onDismiss:(index){
            DataHelper.tumEklenenDersler.removeAt(index);
            setState(() {
              
            });
            print("eleaman cıkarıldı $index");
        }
          
        ) ,

        ),
        
      
      ]),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: _buildTextFromField()),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: _buildHarfler())),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: _buildKrediler())),
              IconButton(
                onPressed: _dersEkleveKontrol,
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: Sabitler.anaRenk,
                iconSize: 30,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }

  _buildHarfler() {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropwdownpadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        value: secilenDeger,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade100,
        onChanged: (deger) {
          setState(() {
            secilenDeger = deger!;
          });
        },
        underline: Container(),
        items: DataHelper.tumderslerinHarfleri(),
      ),
    );
  }

  _buildKrediler() {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropwdownpadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        value: secilenkredi,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        onChanged: (deger) {
          setState(() {
            secilenkredi = deger!;
          });
        },
        underline: Container(),
        items: DataHelper.tumKredilker(),
      ),
    );
  }

  _buildTextFromField() {
    return TextFormField(
        onSaved: (deger) {
          setState(() {
            girilendersadi = deger!;
          });
        },
        validator: (s) {
          if (s!.length <= 0) {
            return 'ders adını giriniz';
          } else
            return null;
        },
        decoration: InputDecoration(
            hintText: "matematik",
            border: OutlineInputBorder(
                borderRadius: Sabitler.borderRadius,
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Sabitler.anaRenk.shade100));
  }

  void _dersEkleveKontrol() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklencekDers = Ders(
          ad: girilendersadi,
          harfDegeri: secilenDeger,
          krediDegeri: secilenkredi);
      print(eklencekDers);
      DataHelper.DersEkle(eklencekDers);

      setState(() {});
      print(DataHelper.ortalamahesapla());
    }
  }
}
