import 'package:flutter/material.dart';
import 'package:temelwidget/models/student.dart';
import 'package:temelwidget/screens/StudentAdd.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {  /* StatefullWidget  => Kullanıcının sayfada dinamik olarak çalışmasını ve dinamik olarak değişebilmesini sağlar. */
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String secilenKisi = "abc";
  List<Student> students = [
    Student("Emre", "Karaloğlu", 28, 55),
    Student("Feyza", "Karaloğlu", 24, 37)
  ];

  String mesaj = "Nesne Uygulaması";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildContext(
          context), // buildContext adında methot oluşturarak daha clean code yazmamız sağlandı.
    );
  }

  String sinavHesapla(int not) {}

  void mesajGoster(BuildContext context, mesaj) {
    var alert = AlertDialog(
      title: Text("Sınav Sonucu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildContext(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.growthengineering.co.uk/wp-content/uploads/2014/05/Interaction-design-user-experience.png"),
                  ),
                  title: Text(students[index].firstName +
                      " " +
                      students[index].lastName),
                  subtitle:
                      Text("Sınavdan Aldığı Not: " + students[index].status),
                  trailing: builderIcon(students[index].grade),
                  onTap: () {
                    setState(() {       /* Seçili Nesne durumu her değiştiğinde, işlevde değişikliği sürdüren methotdur.   */
                      secilenKisi = students[index].firstName +
                      " " +
                      students[index].lastName;
                    });
                    print(students[index].firstName +
                        " " +
                        students[index].lastName);
                  },
                );
              }),
        ),
        Text("Seçili Kişi: " + secilenKisi),
        Row(
          children: <Widget>[
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                  color: Colors.green,
              child: Row(
                children: <Widget>[
                  Icon(Icons.add),
                  SizedBox(width: 5.0,),
                  Text("Add"),
                ],
              ),
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> StudentAdd()));
              }),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                  color: Colors.yellow,
              child: Row(
                children: <Widget>[
                  Icon(Icons.edit),
                  SizedBox(width: 5.0,),
                  Text("Edit"),
                ],
              ),
              onPressed: () {
                var mesaj = sinavHesapla(35);
                mesajGoster(context, mesaj);
              }),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                  color: Colors.red,
              child: Row(
                children: <Widget>[
                  Icon(Icons.delete),
                  SizedBox(width: 5.0,),
                  Text("Delete"),
                ],
              ),
              onPressed: () {
               
              }),
              ),
          ],
        )
        
      ],
    );
  }

  Widget builderIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.check);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
