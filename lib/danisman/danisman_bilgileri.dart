import 'package:flutter/material.dart';

void main() => runApp(danisman_bilgi());

class Teacher {

  String danisman;
  String birim;
  String dmail;

  Teacher({required this.danisman, required this.birim,required this.dmail});
}

class danisman_bilgi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Teacher teacher = Teacher(danisman: 'Nurullah Ozturk', birim: 'Teknik Bilimler MYO 41143',dmail: 'nurullahozturk@kayseri.edu.tr');

    return MaterialApp(
      title: 'Danisman Bilgisi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Danisman Bilgisi'),
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
                backgroundImage: AssetImage('resimler/danisman.png'), //
              ),
              SizedBox(height: 20),
              Text(
                'Danisman Bilgileri',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Danışman Adı Soyadı: ${teacher.danisman}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Birimi: ${teacher.birim}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Email: ${teacher.dmail}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
