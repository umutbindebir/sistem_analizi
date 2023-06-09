import 'package:firebase_auth/firebase_auth.dart';

class Authantication{
  FirebaseAuth ? auth;


  Authantication({required this.apps}){

    this.auth = FirebaseAuth.instanceFor(app: apps, persistence: Persistence.NONE);
  }

  final apps;



  void checkSign(){
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('Kullanıcı oturumu kapatıldı!');
      } else {
        print('Kullanıcı oturum açtı!');
      }
    });
  }
}
