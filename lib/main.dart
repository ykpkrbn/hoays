import 'package:flutter/material.dart';
import 'package:hoays/controller/binding_controller.dart';
import 'package:get/get.dart';
import 'package:hoays/utils/theme.dart';
import 'package:hoays/widgets/bottom_nav_bar.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MyBindingController(),
      title: 'Hoays',
      theme: MyTheme.acikTema,
      darkTheme: MyTheme.koyuTema,
      themeMode: ThemeMode.system,
      home: const MyBottomNavBar(),
    );
  }
}
