import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:obs_proje/giris_kayit/kullanici_giris.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}
final Future<FirebaseApp> _initialization = Firebase.initializeApp();
final FirebaseFirestore firestore = FirebaseFirestore.instance;
final CollectionReference collectionReference = firestore.collection('mail');

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // CHeck for Errors
        if (snapshot.hasError) {
          print("Hatalı bir durum oluştu!");
        }
        // once Completed, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'giriş ekranı',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            home: LoginPage(),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}


