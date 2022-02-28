import 'package:flutter/material.dart';
import 'package:flutterwithgetx/pages/contact_page.dart';
import 'package:flutterwithgetx/pages/heroes_page.dart';
import 'package:flutterwithgetx/pages/home_page.dart';
import 'package:flutterwithgetx/pages/profile_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter with GetX',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/heroes', page: () => HeroesPage()),
        GetPage(name: '/profile', page: () => ProfilePage()),
        GetPage(name: '/contact', page: () => ContactPage()),
      ],
    );
  }
}
