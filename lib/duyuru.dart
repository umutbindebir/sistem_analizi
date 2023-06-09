import 'package:flutter/material.dart';

void main() {
  runApp(duyurualani());
}

class Duyuru {
  final String baslik;
  final String altBilgi;
  bool okundu;

  Duyuru({required this.baslik, required this.altBilgi, this.okundu = false});
}

class duyurualani extends StatefulWidget {
  @override
  _duyurualaniState createState() => _duyurualaniState();
}

class _duyurualaniState extends State<duyurualani> {
  List<Duyuru> duyurular = [
    Duyuru(baslik: 'Devamsızlık Hakkında', altBilgi: '10 Derse Senkron ya da Asenkron girmeyenler devamsızlıktan kalacaktır.'),
    Duyuru(baslik: 'Proje Hakkında', altBilgi: 'Son teslim tarihi 9 haziran 23:59'),
    Duyuru(baslik: 'Yeni dönem harç ücretleri', altBilgi: 'Harç ücretleri önümüzdeki dönem 620 TL olacaktır.'),
    Duyuru(baslik: 'Sistem Analizi ve Tasarım Dersi', altBilgi: 'Yapılan proje  vize ve final yerine geçecektir. Projeyi teslim etmeyen kişiler vize ve final için 0 notu alacaktır.'),
    Duyuru(baslik: 'Ders işlenmeyecektir.', altBilgi: 'Bu haftaki Yabancı Dil II dersimiz önümüzdeki hafta çift ders olarak işlenecektir.'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Duyuru Alanı'),
        ),
        body: ListView.builder(
          itemCount: duyurular.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                duyurular[index].baslik,
                style: TextStyle(
                  fontWeight: duyurular[index].okundu ? FontWeight.normal : FontWeight.bold,
                ),
              ),
              subtitle: Text(duyurular[index].altBilgi),
              trailing: Icon(
                duyurular[index].okundu ? Icons.check_circle : Icons.circle,
                color: duyurular[index].okundu ? Colors.green : Colors.grey,
              ),
              onTap: () {
                setState(() {
                  duyurular[index].okundu = true;
                });
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
