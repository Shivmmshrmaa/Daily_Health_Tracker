import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/postcontroller.dart';

class Fetchdata extends StatelessWidget {
   Fetchdata({super.key});
  final PostController controller = Get.put(PostController());
   final ScrollController scrollController = ScrollController();


   @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount:
      controller.postList.length +
          (controller.hasMore.value ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < controller.postList.length) {
          final post = controller.postList[index];

          // ✅ Animated Card
          return TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 500),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, (1 - value) * 20),
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Title",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(post.title.toString()),
                          const SizedBox(height: 10),
                          const Text(
                            "Description",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(post.body.toString()),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Obx(() {
            if (controller.isLoading.value &&
                controller.hasMore.value) {
              return const Padding(
                padding: EdgeInsets.all(10),
                child: Center(child: CircularProgressIndicator()),
              );
            } else {
              return const SizedBox();
            }
          });
        }
      },
    );
  }
}
