import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/PostsModel.dart';

class PostController extends GetxController {
  RxList<PostsModel> postList = <PostsModel>[].obs;
  RxBool isLoading = false.obs;
  RxInt page = 1.obs;
  final int limit = 20;

  RxBool hasMore = true.obs;
  RxBool isInitialLoading = true.obs;
  var isButtonPressed = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    if (isLoading.value || !hasMore.value) return;

    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse(
          'https://jsonplaceholder.typicode.com/posts?_page=${page.value}&_limit=$limit',
        ),
        headers: {
          'Authorization': 'Bearer faketoken123456',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      print("API called: Status Code => ${response.statusCode}");

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        final List<PostsModel> newPosts =
            data.map((e) => PostsModel.fromJson(e)).toList();

        if (newPosts.length < limit) {
          hasMore.value = false;
        }

        postList.addAll(newPosts);
        page.value++;
      } else {
        print("Failed to load posts. Status: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
      isInitialLoading.value = false;
    }
  }
}
