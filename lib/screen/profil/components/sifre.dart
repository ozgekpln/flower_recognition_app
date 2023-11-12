import 'package:flowers/screen/profil/components/profil.dart';
import 'package:flowers/servis/auth_service.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Şifre Değiştir"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _currentPasswordController,
              decoration: InputDecoration(labelText: "Mevcut Şifre"),
              obscureText: true,
            ),
            TextFormField(
              controller: _newPasswordController,
              decoration: InputDecoration(labelText: "Yeni Şifre"),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                authService.changePassword(_currentPasswordController.text,
                    _newPasswordController.text);
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => const Profil()));
              },
              child: Text("Şifreyi Değiştir"),
            ),
          ],
        ),
      ),
    );
  }
}
