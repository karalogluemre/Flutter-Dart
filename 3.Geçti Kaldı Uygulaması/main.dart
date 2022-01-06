import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  String mesaj = "Benim ilk Uygulamam!";
  @override
  Widget build(BuildContext context) {
    var ogrenciler = ["Emre", "Mustafa", "Hasaan"];
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                // Liste görünümü oluşturucusuyla
                itemCount:
                    ogrenciler.length, //ogrenciler dizisinin eleman sayısı
                itemBuilder: (BuildContext context, int index) {
                  //baglam olusturarak,dizideki her eleman sayısı kadar öğe oluştur.
                  return Text(ogrenciler[
                      index]); // return ederek text formatında her bir veriyi ekrana bas.
                }),
          ),
          Center(
            child: RaisedButton(
                child: Text("Tıkla"),
                onPressed: () {
                  var mesaj = sinavHesapla(35);
                  mesajGoster(context, mesaj);
                }),
          ),
        ],
      ),
    );
  }

  String sinavHesapla(int not) {
    String mesaj = "";
    if (not >= 50) {
      mesaj = "Geçti";
    } else if (not >= 40) {
      mesaj = "Bütünlemeye kaldı";
    } else {
      mesaj = "Kaldı";
    }
    return mesaj;
  }

  void mesajGoster(BuildContext context, mesaj) {
    var alert = AlertDialog(
      title: Text("Sınav Sonucu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
