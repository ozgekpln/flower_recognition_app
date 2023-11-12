import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowers/sabit_degerler.dart';
import 'package:flowers/screen/profil/components/girisekrani.dart';
import 'package:flowers/screen/profil/components/kullanicilabel.dart';
import 'package:flowers/servis/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Kayit extends StatefulWidget {
  const Kayit({super.key});

  @override
  State<Kayit> createState() => _KayitState();
}

class _KayitState extends State<Kayit> {
  late String email, sifre, kullaniciadi, ad;

  final formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0, left: 10),
                  child: SizedBox(
                    height: size.height * .1,
                    child: IconButton(
                        onPressed: (() {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  duration: const Duration(milliseconds: 500),
                                  child: const Giris(),
                                  type: PageTransitionType.leftToRight));
                        }),
                        icon: const Icon(Icons.arrow_back_ios)),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * .35,
                      child: const Image(
                        image: AssetImage("assets/resimler/a5.jpg"),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Kayıt Ol",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: renk1,
                          fontSize: padding1 * 1.5,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    girislabel(
                      func: (alinanveri) {
                        setState(() {
                          ad = alinanveri!;
                        });
                      },
                      type: TextInputType.name,
                      icon: Icons.person,
                      obscureText: false,
                      hintText: 'Ad Soyad',
                    ),
                    girislabel(
                      func: (alinanmail) {
                        setState(() {
                          email = alinanmail!;
                        });
                      },
                      type: TextInputType.emailAddress,
                      icon: Icons.mail,
                      obscureText: false,
                      hintText: 'Mail',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    girislabel(
                      func: (alinanveri) {
                        setState(() {
                          kullaniciadi = alinanveri!;
                        });
                      },
                      type: TextInputType.text,
                      icon: Icons.alternate_email,
                      obscureText: false,
                      hintText: 'Kullanıcı Adı',
                    ),
                    girislabel(
                      func: (alinanveri) {
                        setState(() {
                          sifre = alinanveri!;
                        });
                      },
                      type: TextInputType.text,
                      icon: Icons.lock,
                      obscureText: true,
                      hintText: 'Şifre',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          final result = await authService.signUp(
                              ad, email, kullaniciadi, sifre);

                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: const Giris(),
                                  type: PageTransitionType.bottomToTop));
                        }
                      },
                      child: Container(
                        width: size.width * .97,
                        decoration: BoxDecoration(
                          color: renk1,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: const Center(
                            child: Text(
                          "Kayıt Ol",
                          style: TextStyle(
                            fontSize: padding1,
                          ),
                        )),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/* var userSonuc = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: sifre);
        formkey.currentState!.reset();
        print(userSonuc.user!.uid);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text("Kayıt başarılı. Giriş sayfasına yönlendiriliyorsunuz."),
          ),
        );
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: Giris(), type: PageTransitionType.bottomToTop));*/