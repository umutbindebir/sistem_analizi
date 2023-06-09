import 'package:flutter/material.dart';

void main() {
  runApp(ders_kayit());
}

class ders_kayit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ders Kaydı',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DersKaydiScreen(),
    );
  }
}

class DersKaydiScreen extends StatefulWidget {
  @override
  _DersKaydiScreenState createState() => _DersKaydiScreenState();
}

class _DersKaydiScreenState extends State<DersKaydiScreen> {
  List<String> secilenDersler = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ders Kaydı'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Bilgisayar Programcılığı Bölümü Dersleri',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DersTile(
                      dersAdi: 'Bilgisayarlı Kontrol',
                      onSecildi: (secildi) {
                        setState(() {
                          if (secildi) {
                            secilenDersler.add('Bilgisayarlı Kontrol');
                          } else {
                            secilenDersler.remove('Bilgisayarlı Kontrol');
                          }
                        });
                      },
                    ),
                    DersTile(
                      dersAdi: 'Sistem Analizi  ve Tasarımı',
                      onSecildi: (secildi) {
                        setState(() {
                          if (secildi) {
                            secilenDersler.add('Sistem Analizi  ve Tasarımı');
                          } else {
                            secilenDersler.remove('Sistem Analizi  ve Tasarımı');
                          }
                        });
                      },
                    ),
                    DersTile(
                      dersAdi: 'Ağ Temelleri',
                      onSecildi: (secildi) {
                        setState(() {
                          if (secildi) {
                            secilenDersler.add('Ağ Temelleri');
                          } else {
                            secilenDersler.remove('Ağ Temelleri');
                          }
                        });
                      },
                    ),
                    DersTile(
                      dersAdi: 'Görsel Programlama II',
                      onSecildi: (secildi) {
                        setState(() {
                          if (secildi) {
                            secilenDersler.add('Görsel Programlama');
                          } else {
                            secilenDersler.remove('Görsel Programlama');
                          }
                        });
                      },
                    ),
                    DersTile(
                      dersAdi: 'Bilgisayarlı Kontrol',
                      onSecildi: (secildi) {
                        setState(() {
                          if (secildi) {
                            secilenDersler.add('Bilgisayarlı Kontrol');
                          } else {
                            secilenDersler.remove('Bilgisayarlı Kontrol');
                          }
                        });
                      },
                    ),
                    DersTile(
                      dersAdi: 'İçerik  Yönetimi ve Sistemleri',
                      onSecildi: (secildi) {
                        setState(() {
                          if (secildi) {
                            secilenDersler.add('İçerik  Yönetimi ve Sistemleri');
                          } else {
                            secilenDersler.remove('İçerik  Yönetimi ve Sistemleri');
                          }
                        });
                      },
                    ),
                    DersTile(
                      dersAdi: 'Yabancı Dil',
                      onSecildi: (secildi) {
                        setState(() {
                          if (secildi) {
                            secilenDersler.add('Yabancı Dil');
                          } else {
                            secilenDersler.remove('Yabancı Dil');
                          }
                        });
                      },
                    ),
                    DersTile(
                      dersAdi: 'Bilgisayarlı Programlama',
                      onSecildi: (secildi) {
                        setState(() {
                          if (secildi) {
                            secilenDersler.add('Bilgisayarlı Programlama');
                          } else {
                            secilenDersler.remove('Bilgisayarlı Programlama');
                          }
                        });
                      },
                    ),
                    DersTile(
                      dersAdi: 'Veri Analizi (Seçmeli)',
                      onSecildi: (secildi) {
                        setState(() {
                          if (secildi) {
                            secilenDersler.add('Veri Analizi (Seçmeli)');
                          } else {
                            secilenDersler.remove('Veri Analizi (Seçmeli)');
                          }
                        });
                      },
                    ),
                    DersTile(
                      dersAdi: 'Veritabanı Yönetimi',
                      onSecildi: (secildi) {
                        setState(() {
                          if (secildi) {
                            secilenDersler.add('Veritabanı Yönetimi');
                          } else {
                            secilenDersler.remove('Veritabanı Yönetimi');
                          }
                        });
                      },
                    ),
                    DersTile(
                      dersAdi: 'Mobil Programlama',
                      onSecildi: (secildi) {
                        setState(() {
                          if (secildi) {
                            secilenDersler.add('Mobil Programlama');
                          } else {
                            secilenDersler.remove('Mobil Programlama');
                          }
                        });
                      },

                    ),

                    DersTile(
                      dersAdi: 'Veri Kontrolü (Seçmeli)',
                      onSecildi: (secildi) {
                        setState(() {
                          if (secildi) {
                            secilenDersler.add('Veri Kontrolü');
                          } else {
                            secilenDersler.remove('Veri Kontrolü');
                          }
                        });
                      },

                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  secilenDersler = [];
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Ders kaydı tamamlandı.'
                        'Ücreti banka ya da atm yoluyla '
                        'Kimlik numaranız ile yatırabilirsiniz.'),
                  ),
                );
              },
              child: Text('Ders Kaydını Tamamla'),
            ),
          ],
        ),
      ),
    );
  }
}

class DersTile extends StatefulWidget {
  final String dersAdi;
  final Function(bool) onSecildi;

  DersTile({required this.dersAdi, required this.onSecildi});

  @override
  _DersTileState createState() => _DersTileState();
}

class _DersTileState extends State<DersTile> {
  bool secildi = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.dersAdi),
      leading: Checkbox(
        value: secildi,
        onChanged: (value) {
          setState(() {
            secildi = value!;
            widget.onSecildi(secildi);
          });
        },
      ),
    );
  }
}
