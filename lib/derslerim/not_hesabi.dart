import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yüzde Hesaplama',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: not_hesabi(),
    );
  }
}

class not_hesabi extends StatefulWidget {
  @override
  _not_hesabiState createState() => _not_hesabiState();
}

class _not_hesabiState extends State<not_hesabi> {
  final TextEditingController _number1Controller = TextEditingController();
  final TextEditingController _number2Controller = TextEditingController();
  final TextEditingController _number3Controller = TextEditingController();
  final TextEditingController _number4Controller = TextEditingController();
  double result = 0.0;
  double sonuc = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Not Hesabi'),
    leading: IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {
    Navigator.pop(context);
    },
    ),
    ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            TextField(
              controller: _number1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: ' (Vize) %20 Kayuzem Dersleri için burayı kullanınız.',
                hintText: 'Birinci Sayıyı Girin',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _number2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '(Final) %80 Kayuzem Dersleri için burayı kullanınız.',
                hintText: 'İkinci Sayıyı Girin',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                calculatePercentage();
              },
              child: Text('Hesapla'),
            ),
            Text(
              'Sonuç: $result',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _number3Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '(Vize) %40 Alan Dersleri için burayı kullanınız.',
                hintText: '1. Sayıyı Girin',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _number4Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '(Final) %60 Alan Dersleri için burayı kullanınız.',
                hintText: '2. Sayıyı girin',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                hesaplayici();
              },
              child: Text('Hesapla'),
            ),
            Text(
              'Sonuç: $sonuc',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void calculatePercentage() {
    double number1 = double.tryParse(_number1Controller.text) ?? 0.0;
    double number2 = double.tryParse(_number2Controller.text) ?? 0.0;

    double twentyPercent = (number1 * 0.20);
    double eightyPercent = (number2 * 0.80);
    setState(() {
      result = twentyPercent + eightyPercent;

    });
  }

  void hesaplayici() {
    double number3 = double.tryParse(_number3Controller.text) ?? 0.0;
    double number4 = double.tryParse(_number4Controller.text) ?? 0.0;
    double fourtyPercent = (number3 * 0.40);
    double sixtyPercent = (number4 * 0.60);

    setState(() {
      sonuc = fourtyPercent + sixtyPercent;
    });
  }
}