import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flowers/sabit_degerler.dart';
import 'package:flowers/screen/bitkiler/components/bitki.dart';
import 'package:flowers/screen/favoriler/components/favorisayfasi.dart';
import 'package:flowers/screen/home/components/home.dart';
import 'package:flowers/screen/kamera/components/kamera.dart';
import 'package:flowers/screen/profil/components/profil.dart';
import 'package:flowers/servis/auth_service.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _bottoNavIndex = 0;

  List<Widget> sayfalar = const [
    HomeScreen(),
    Favori(),
    Kamera(),
    Bitki(),
    Profil(),
  ];

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.camera_alt_outlined,
    Icons.nature,
    Icons.person,
  ];

  List<String> titleList = [
    'Flora',
    'Favoriler',
    'Camera',
    'Bitkiler',
    'Profil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleList[_bottoNavIndex],
              style: TextStyle(
                color: renk1,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            Icon(
              Icons.menu,
              color: renk1,
              size: 30.0,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      */
      body: IndexedStack(
        index: _bottoNavIndex,
        children: sayfalar,
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
                child: const Kamera(), type: PageTransitionType.bottomToTop),
          );
        },
        child: Icon(Icons.camera_alt_rounded),
        backgroundColor: renk1,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,*/
      bottomNavigationBar: CurvedNavigationBar(
        height: padding1 * 3,
        color: renk1,
        buttonBackgroundColor: renk1,
        backgroundColor: Colors.white,
        items: const [
          CurvedNavigationBarItem(
            child: Icon(Icons.home_outlined),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.favorite_border),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.camera_alt_outlined),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.nature_outlined,
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.perm_identity),
          ),
        ],
        onTap: (index) => {
          setState(
            () {
              _bottoNavIndex = index;
              if (_bottoNavIndex == 1) {
                authService.getfav();
              }
            },
          ),
        },
      ),
      /*bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: renk1,
        activeColor: renk1,
        inactiveColor: Colors.black54,
        icons: iconList,
        activeIndex: _bottoNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => {
          setState(() {
            _bottoNavIndex = index;
          })
        },
      ),*/
    );
  }
}
