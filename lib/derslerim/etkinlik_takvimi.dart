import 'package:flutter/material.dart';

void main() {
  runApp(etkinlik_takvimi());
}

class etkinlik_takvimi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: etkinliktablosusayfasi(),
    );
  }
}

class etkinlik {
  final String name;
  final DateTime date;

  etkinlik({required this.name, required this.date});
}

class etkinliktablosusayfasi extends StatefulWidget {
  @override
  _etkinliktablosusayfasiState createState() => _etkinliktablosusayfasiState();
}

class _etkinliktablosusayfasiState extends State<etkinliktablosusayfasi> {
  List<etkinlik> events = [
    etkinlik(name: 'Kodlama Saati', date: DateTime(2023, 12, 25)),
    etkinlik(name: 'Ankara Gezisi', date: DateTime(2023, 1, 20)),
    etkinlik(name: 'Duman Konseri', date: DateTime(2023, 2, 10)),
    etkinlik(name: 'Siber Güvenlik Semineri', date: DateTime(2023, 2, 15)),
    etkinlik(name: 'Bilişim Ağı Toplantısı', date: DateTime(2023, 7, 30)),
  ];

  List<bool> participationStatus = [false, false, false, false, false];
  String feedbackMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Etkinlik Takvimi'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: _buildColumns(),
          rows: _buildRows(),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                feedbackMessage = 'Katılımınız Onaylanmıştır.';
              });
            },
            child: Text('Katılacağımı Onaylıyorum'),
          ),
        ),
      ),
      persistentFooterButtons: <Widget>[
        Text(feedbackMessage),
      ],
    );
  }

  List<DataColumn> _buildColumns() {
    return [
      DataColumn(
        label: Text('Etkinlik'),
      ),
      DataColumn(
        label: Text('Tarih'),
      ),
      DataColumn(
        label: Text('Katılım Durumu'),
      ),
    ];
  }

  List<DataRow> _buildRows() {
    return events.map((event) {
      int index = events.indexOf(event);
      return DataRow(
        cells: [
          DataCell(Text(event.name)),
          DataCell(Text('${event.date.day} ${_getMonthName(event.date.month)}')),
          DataCell(
            Checkbox(
              value: participationStatus[index],
              onChanged: (value) {
                setState(() {
                  participationStatus[index] = value!;
                });
              },
            ),
          ),
        ],
      );
    }).toList();
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Ocak';
      case 2:
        return 'Şubat';
      case 3:
        return 'Mart';
      case 4:
        return 'Nisan';
      case 5:
        return 'Mayıs';
      case 6:
        return 'Haziran';
      case 7:
        return 'Temmuz';
      case 8:
        return 'Ağustos';
      case 9:
        return 'Eylül';
      case 10:
        return 'Ekim';
      case 11:
        return 'Kasım';
      case 12:
        return 'Aralık';
      default:
        return '';
    }
  }
}
