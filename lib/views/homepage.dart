import 'package:daily_health/controllers/themecontroller.dart';
import 'package:daily_health/widgets/apptheme.dart';
import 'package:daily_health/widgets/fetchdata.dart';
import 'package:daily_health/widgets/floatingactionbutton.dart';
import 'package:daily_health/widgets/userDetail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/postcontroller.dart';
import '../widgets/countdown_timer.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final PostController controller = Get.put(PostController());
  final ScrollController scrollController = ScrollController();
  final ThemeController themeController = Get.find();
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    if (!scrollController.hasListeners) {
      scrollController.addListener(() {
        if (scrollController.position.pixels >=
                scrollController.position.maxScrollExtent - 100 &&
            controller.hasMore.value &&
            !controller.isLoading.value) {
          controller.fetchPosts();
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " DAILY HEALTH TRACKER",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
        ),
        centerTitle: true,
        actions: [
          ///APP THEME
          Apptheme(),
        ],
      ),
      body: Obx(() {
        if (controller.isInitialLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            if (user != null)
              ///USERDEATILS
              Userdetail(),

            ///COUNTDOWNTIMER
            const CountdownTimerWidget(),

            ///API FETCH DATA
            Expanded(child: Fetchdata()),
          ],
        );
      }),

      ///FLOATING ACTION BUTTON
      floatingActionButton: Floatingbutton(),
    );
  }
}
