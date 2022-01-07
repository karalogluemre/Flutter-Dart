import 'package:flutter/material.dart';
import 'package:temelwidget/models/student.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
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
                    setState(() {
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
        Center(
          child: RaisedButton(
              child: Text("Tıkla"),
              onPressed: () {
                var mesaj = sinavHesapla(35);
                mesajGoster(context, mesaj);
              }),
        ),
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
