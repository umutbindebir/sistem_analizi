import 'package:flutter/material.dart';

class AnketSayfasi extends StatefulWidget {
  @override
  _AnketSayfasiState createState() => _AnketSayfasiState();
}
class _AnketSayfasiState extends State<AnketSayfasi> {
  List<String> sorular = [
    'Ders işleyişinden memnun musunuz?',
    'Ders materyallerini yeterli buluyor musunuz?',
    'Okulun temizliğini nasıl buluyorsunuz ?',
    'Yemekhane yemekleri sizce nasıl?',
    'Ders sürelerini nasıl buluyorsunuz ?',
    'Blok dersleri seviyor musunuz?',
    'Okulumuzdaki sosyal faliyetler sizin için yeterli mi?',
  ];
  List<int> puanlar = List<int>.filled(12, 0); //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deneyim Anketi'),
      ),
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(sorular[index]),
            subtitle: Slider(
              min: 0,
              max: 5,
              divisions: 5,
              value: puanlar[index].toDouble(),
              onChanged: (double value) {
                setState(() {
                  puanlar[index] = value.toInt();
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Anket Tamamlandı'),
                content: Text('Anketi tamamladınız. Teşekkürler!'),
                actions: [
                  TextButton(
                    child: Text('Kapat'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AnketSayfasi(),
  ));
}