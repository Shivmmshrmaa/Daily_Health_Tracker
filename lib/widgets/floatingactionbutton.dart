import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/postcontroller.dart';
import 'setGraph.dart';

class Floatingbutton extends StatelessWidget {
   Floatingbutton({super.key});
  final PostController controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => controller.isButtonPressed.value = true,
      onTapUp: (_) {
        controller.isButtonPressed.value = false;
        _showGraphBottomSheet(context);
      },
      child: Obx(() {
        return AnimatedScale(
          duration: const Duration(milliseconds: 100),
          scale: controller.isButtonPressed.value ? 0.9 : 1.0,
          child: FloatingActionButton.extended(
            onPressed: null, // onTap handled above
            label: const Text("Show Weekly Graph"),
            icon: const Icon(Icons.bar_chart),
          ),
        );
      }),
    );
  }
}
void _showGraphBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    isScrollControlled: true,
    builder: (_) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: StepGraph(),
          );
        },
      );
    },
  );
}
