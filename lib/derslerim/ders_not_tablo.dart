import 'package:flutter/material.dart';

void main() {
  runApp(const not_bilgitablo());
}

class not_bilgitablo extends StatelessWidget {
  const not_bilgitablo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Üniversite Not Sistemi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  not_listelemeekrani(),
    );
  }
}

class not_listelemeekrani extends StatelessWidget {
  final List<Ders> dersler = [
    Ders(name: 'Sistem Analizi ve Tasarımı', vize: 90, finalnot: 80),
    Ders(name: 'Bilgisayarlı Kontrol', vize: 25, finalnot: 65),
    Ders(name: 'İçerik Yönetim Sistemleri', vize: 60, finalnot: 30),
    Ders(name: 'Görsel Programlama II', vize: 70, finalnot: 65),
    Ders(name: 'İnternet Programcılığı II ', vize: 80, finalnot: 90),
    Ders(name: 'Mobil Programlama', vize: 50, finalnot: 45),
    Ders(name: 'Yabancı Dil II', vize: 65, finalnot: 50),
    Ders(name: 'Veri Kontrolü ', vize: 85, finalnot: 90),

  ];

  @override
  Widget build(BuildContext context) {return WillPopScope(
      onWillPop: () async {

    Navigator.pop(context);
    return false;
  },
    child: Scaffold(
    appBar: AppBar(
    title: const Text('Ders Notları'),
    ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Ders')),
              DataColumn(label: Text('Vize')),
              DataColumn(label: Text('Final')),
              DataColumn(label: Text('Ortalama')),
              DataColumn(label: Text('Harf Notu')),
              DataColumn(label: Text('Durum')),
            ],
            rows: List<DataRow>.generate(
              dersler.length,
                  (index) {
                final ders = dersler[index];
                final ortalama = (ders.vize * 0.4) + (ders.finalnot * 0.6);
                final durum = ortalama >= 50 ? 'Geçti' : 'Kaldı';
                final harfNotu = harfNotunuHesapla(ortalama);

                return DataRow(
                  cells: [
                    DataCell(Text(ders.name)),
                    DataCell(Text(ders.vize.toString())),
                    DataCell(Text(ders.finalnot.toString())),
                    DataCell(Text(ortalama.toStringAsFixed(2))),
                    DataCell(Text(harfNotu)),
                    DataCell(Text(durum)),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    ));
  }

  String harfNotunuHesapla(double ortalama) {
    if (ortalama >= 90) {
      return 'AA';
    } else if (ortalama >= 85) {
      return 'BA';
    } else if (ortalama >= 80) {
      return 'BB';
    } else if (ortalama >= 75) {
      return 'CB';
    } else if (ortalama >= 70) {
      return 'CC';
    } else if (ortalama >= 65) {
      return 'DC';
    } else if (ortalama >= 60) {
      return 'DD';
    } else if (ortalama >= 55) {
      return 'FD';
    } else {
      return 'FF';
    }
  }
}

class Ders {
  final String name;
  final int vize;
  final int finalnot;

  const Ders({
    required this.name,
    required this.vize,
    required this.finalnot,
  });
}
