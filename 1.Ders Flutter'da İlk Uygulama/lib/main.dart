import 'package:flutter/material.dart';

void Main() {
  //fonksiyon
  runApp(MaterialApp(home: MyApp()
      //
      ));
}

class MyApp extends StatelessWidget {
  String mesaj = "Benim ilk Uygulamam!";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: Center(
        child: RaisedButton(
          child:Text("Tıkla"),
          onPressed: () {
          var alert = AlertDialog(
            title: Text("Sınav Sonucu"),
            content: Text("Geçti"),
          );
          showDialog(
              context: context, builder: (BuildContext context) => alert
              );
        }),
      ),
    );
  }
}
