import 'package:ai_ecommerce/core/extensions/app_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../authentication/login/login_screen.dart';

// LabeledGlobalKey<ScaffoldState> profileSK = LabeledGlobalKey<ScaffoldState>("profileSK");

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: profileSK,
      appBar: AppBar(
        title: const Text('Profil'),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
                Navigator.of(context).pushRemoveUntil(const LoginScreen());
            },
            icon: const Icon(Icons.logout_outlined),
            label: const Text("Log Out"),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/women/65.jpg'),
              ),
              SizedBox(height: 16),
              Text(
                'Kullanıcı Adı',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'kullaniciadi@gmail.com',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 16),
              Text(
                'Bilgilerim',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Ad Soyad'),
                subtitle: Text('Kullanıcı Adı'),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('E-posta'),
                subtitle: Text('kullaniciadi@gmail.com'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Telefon'),
                subtitle: Text('+90 555 555 55 55'),
              ),
              SizedBox(height: 16),
              Text(
                'Adreslerim',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Adres'),
                subtitle: Text('İstanbul, Türkiye'),
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Adres'),
                subtitle: Text('Ankara, Türkiye'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
