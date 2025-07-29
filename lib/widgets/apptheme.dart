import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../controllers/themecontroller.dart';

class Apptheme extends StatelessWidget {
   Apptheme({super.key});
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => IconButton(
        icon: Icon(
          themeController.isDarkMode.value
              ? Icons.dark_mode
              : Icons.light_mode,
        ),
        onPressed: () {
          themeController.toggleTheme();
        },
      ),
    );
  }
}
