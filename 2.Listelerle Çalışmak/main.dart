import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  String mesaj = "Benim ilk Uygulamam!";
  @override
  Widget build(BuildContext context) {
    var ogrenciler = ["Emre", "Mustafa", "Hasan"];
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder( // Liste görünümü oluşturucusuyla
                itemCount: ogrenciler.length,  //ogrenciler dizisinin eleman sayısı 
                itemBuilder: (BuildContext context, int index) { //baglam olusturarak,dizideki her eleman sayısı kadar öğe oluştur. 
                  return Text(ogrenciler[index]); // return ederek text formatında her bir veriyi ekrana bas.
                }),
          ),
          Center(
            child: RaisedButton(
                child: Text("Tıkla"),
                onPressed: () {
                  var alert = AlertDialog(
                    title: Text("Sınav Sonucu"),
                    content: Text("Geçti"),
                  );
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => alert);
                }),
          ),
        ],
      ),
    );
  }
}
