import 'package:flutter/material.dart';

class StudentAdd extends StatefulWidget{  // StudentAdd isminde bir class belirterek bunun StatefulWidget olarak ayarlayarak sayfanın dinamik olarak çalışmasını sağladık 
  @override //bunun bir override olması gerektiğini 
  State<StatefulWidget> createState() {  // ve yeni bir durum oluşturduk
    // TODO: implement createState
    return _StudentAddState(); // override olarak yapılan her değişiklik return aracılığı ile sayfadaki görünümü kazanır.
  }
}


class _StudentAddState extends State{  //tekrardan override ederek sayfadaki görünümlerini ekleriz.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Ekle"),
      ),
      body: Center(
        child: Text("Öğrenci Formu Buradan Eklenecek!"),
      ),
    );
  }

}
