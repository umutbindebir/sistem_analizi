import 'package:flutter/material.dart';
import 'package:obs_proje/danisman/danisman_bilgileri.dart';
import 'package:obs_proje/anket.dart';
import 'package:obs_proje/derslerim//ders_programi.dart';
import 'package:obs_proje/derslerim//not_hesabi.dart';
import 'package:obs_proje/derslerim//ogrenci_paneli.dart';
import 'package:obs_proje/derslerim/ders_not_tablo.dart';
import 'package:obs_proje/derslerim/etkinlik_takvimi.dart';
import 'package:obs_proje/duyuru.dart';
import 'package:obs_proje/kayitlanma/ders_kayit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Öğrenci Bilgileri';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: secimyeri(),
    );
  }
}

class secimyeri extends StatelessWidget {
  const secimyeri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Öğrenci Paneli'),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Sütun sayısı
          ),
          itemCount: 9, // Buton sayısı
          itemBuilder: (context, index) {
            return buildButton(context, index);
          },
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context, int index) {
    List<String> titles = [
      'Danışman Bilgi',
      'Öğrenci Bilgileri',
      'Ders Kayıt',
      'Derslerim',
      'Not Bilgileri Tablo',
      'Not Hesaplama',
      'Duyurular',
      'Etkinlik',
      'Anket',

    ];

    List<String> imagePaths = [
      'resimler/danismen.png',
      'resimler/ogrencii.png',
      'resimler/derskayit.png',
      'resimler/dersler.png',
      'resimler/notlar.png',
      'resimler/notlar.png',
      'resimler/etkinlik.png',
      'resimler/nothesabi.png',
      'resimler/anket.png',

    ];

    List<Widget> routes = [
      danisman_bilgi(),
      ogrenci_bilgileri(),
      ders_kayit(),
      ders_programi(),
      not_bilgitablo(),
      not_hesabi(),
      duyurualani(),
      etkinlik_takvimi(),
      AnketSayfasi(),

    ];

    return Container(
      margin: const EdgeInsets.all(20),
      child: Align(
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => routes[index],
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(
                  imagePaths[index],
                  width: 90,
                  height: 90,
                ),
              ),
              const SizedBox(height: 8),
              Flexible(
                child: Text(
                  titles[index],
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
