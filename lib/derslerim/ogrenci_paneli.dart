import 'package:flutter/material.dart';

void main() => runApp(ogrenci_bilgileri());

class Student {
  String isim;
  String soyisim;
  int numarasi;
  String bolum;


  Student({required this.isim,required this.soyisim, required this.numarasi, required this.bolum, });
}

class ogrenci_bilgileri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Student student = Student(isim: ' Zeki Umut', soyisim: 'Bindebir', numarasi: 3010720306, bolum: 'Bilgisayar Proramcılığı');

    return MaterialApp(
      title: 'Öğrenci Bilgisi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Öğrenci Bilgisi'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('resimler/Ogrenciresim.png'),
              ),
              SizedBox(height: 20),
              Text(
                'Öğrenci Bilgileri',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'İsim: ${student.isim}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Soyisim: ${student.soyisim}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Öğrenci No: ${student.numarasi}',
                style: TextStyle(fontSize: 16),
              ),

            ],
          ),
        ),
      ),
    );
  }
}