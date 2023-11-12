import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowers/aray%C3%BCz/root_page.dart';
import 'package:flowers/sabit_degerler.dart';
import 'package:flowers/screen/k%C4%B1lavuz/nas%C4%B1l_cal%C4%B1s%C4%B1r.dart';
import 'package:flowers/screen/profil/components/kayitekrani.dart';
import 'package:flowers/screen/profil/components/kullanicilabel.dart';
import 'package:flowers/screen/profil/components/profil.dart';
import 'package:flowers/servis/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Giris extends StatefulWidget {
  const Giris({super.key});

  @override
  State<Giris> createState() => _GirisState();
}

class _GirisState extends State<Giris> {
  late String email, sifre;

  //final sharedPreferences = await SharedPreferences.getInstance();

  final formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => firebaseAuth.currentUser;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController sifreController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getSavedCredentials();
  }

  Future<void> getSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email') ?? '';
    sifre = prefs.getString('sifre') ?? '';
    emailController.text = email;
    sifreController.text = sifre;
  }

  Future<void> saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    prefs.setString('sifre', sifre);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const BaslaSayfasi(
                  image: "assets/resimler/a2.png",
                  tittle: "Giriş Yap",
                  aciklama: "",
                  renk: Color.fromARGB(255, 1, 14, 49),
                ),
                girislabel(
                  controller: emailController,
                  func: (alinanmail) {
                    setState(() {
                      email = alinanmail!;
                    });
                  },
                  type: TextInputType.emailAddress,
                  icon: Icons.alternate_email,
                  obscureText: false,
                  hintText: 'email',
                ),
                girislabel(
                  controller: sifreController,
                  func: (alinansifre) {
                    setState(() {
                      sifre = alinansifre!;
                    });
                  },
                  type: null,
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
                      final result = await authService.signIn(email, sifre);
                      //print(result);
                      if (result == "success") {
                        saveCredentials();
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: RootPage(),
                                type: PageTransitionType.bottomToTop));
                        authService.result;
                      } else {
                        // ignore: use_build_context_synchronously
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Hata"),
                                content: Text(result),
                              );
                            });
                      }
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
                      "Giriş Yap",
                      style: TextStyle(
                        fontSize: padding1,
                      ),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: const RootPage(),
                            type: PageTransitionType.bottomToTop));
                  },
                  child: const Center(
                    child: Text.rich(TextSpan(
                        text: 'Şifremi unuttum',
                        style: TextStyle(color: siyah))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Hesabın yok mu?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: const Kayit(),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: const Text(
                        "Kaydol",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
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
