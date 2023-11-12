import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: camel_case_types
class authService {
  static final firebaseAuth = FirebaseAuth.instance;
  static final firebaseFirestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final currentuser = _auth.currentUser;
  static String? doc;
  static final DocumentReference _kullanici =
      FirebaseFirestore.instance.collection('Kullanici').doc(doc);

  static dynamic result = authService().getUser();
  static List<String>? favorites;

  static List<dynamic> favs = [];

  static Future<String> signIn(String email, String sifre) async {
    String? res;
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: sifre);
      res = "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        res = "Kullanici bulunamadı";
      } else if (e.code == "wrong-password") {
        res = "Şifre yanlış";
      } else if (e.code == "user-disabled") {
        res = "Kullanici pasif";
      }
    }
    getdoc();

    return res as String;
  }

  static void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static changePassword(String currentPassword, String newPassword) async {
    User? user = FirebaseAuth.instance.currentUser;
    AuthCredential credentials = EmailAuthProvider.credential(
        email: user!.email!, password: currentPassword);

    try {
      // Kullanıcının kimlik bilgilerini kontrol et
      await user.reauthenticateWithCredential(credentials);

      // Şifreyi güncelle
      await user.updatePassword(newPassword);

      print("Şifre başarıyla güncellendi");
    } catch (e) {
      print("Şifre güncellenirken bir hata oluştu: $e");
    }
  }

  static Future<String> signUp(
      String ad, String email, String kullaniciadi, String sifre) async {
    String? res;
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: sifre);

      try {
        final sonuc = await firebaseFirestore.collection("Kullanici").add({
          "name": ad,
          "mail": email,
          "kullaniciadi": kullaniciadi,
          "favoriler": [],
          "profilURL": "",
        });
      } catch (e) {
        print(e.toString());
      }
      res = "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        res = "mail zaten kayıtlı";
      } else if (e.code == "ERROR_INVALID_EMAIL") {
        res = "Geçersiz mail";
      } else {
        res = "Bir hata ile karşılaşıldı. Tekrar deneyiniz.";
      }
    }

    return res as String;
  }

  Future getUser() async {
    List items = [];
    try {
      await firebaseFirestore
          .collection("Kullanici")
          .where('mail', isEqualTo: currentuser!.email)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          items.add(element.data());
        });
      });
      getfav();
    } catch (e) {
      print(e.toString());
    }
  }

  static Future fav(String bitki) async {
    try {
      await _kullanici.update({
        'favoriler': FieldValue.arrayUnion([bitki])
      });
      getfav();
    } catch (e) {
      print(e.toString());
    }
  }

  static Future getfav() async {
    try {
      await _kullanici.get().then((value) {
        return (favs = value.get("favoriler"));
      });
    } catch (e) {
      print(e.toString());
    }
  }

  static Future unfav(String bitki) async {
    try {
      await _kullanici.update({
        'favoriler': FieldValue.arrayRemove([bitki])
      });
      getfav();
    } catch (e) {
      print(e.toString());
    }
  }

  static Future getdoc() async {
    try {
      firebaseFirestore
          .collection('Kullanici')
          .where('mail', isEqualTo: currentuser!.email)
          .get()
          .then((documentSnapshot) {
        documentSnapshot.docs.forEach((element) {
          doc = element.id;
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
