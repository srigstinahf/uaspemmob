import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Tambahkan GetX
import 'package:uaspemmob/pages/login_page.dart';
import 'package:uaspemmob/api/api_service.dart';
 // Import ApiService

void main() {
  Get.put(ApiService()); // Registrasikan ApiService
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Gantilah MaterialApp dengan GetMaterialApp
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}