import 'package:blog_explorer/constants/keys.dart';
import 'package:blog_explorer/helpers/api_helper.dart';
import 'package:blog_explorer/helpers/storage_helper.dart';
import 'package:blog_explorer/models/blog_data.dart';
import 'package:get/get.dart';

class BlogController extends GetxController {
  final String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';

  RxList<BlogData> blogList = <BlogData>[].obs;
  bool isLoading = true;
  static RxSet<BlogData> favortieBlogList = <BlogData>{}.obs;

  static void toggleFavorite(BlogData blogData) {
    if (favortieBlogList.contains(blogData)) {
      favortieBlogList.remove(blogData);
      favortieBlogList.refresh();
      return;
    }
    favortieBlogList.add(blogData);
    favortieBlogList.refresh();
  }
  static bool checkFavorite(BlogData blogData) =>
      favortieBlogList.contains(blogData);

  Future<void> getBlogs() async {
    Map<String, dynamic>? jsonData = await ApiHelper.callGetApi(url, headers: {
      'x-hasura-admin-secret': kAPIkey,
    });
    List<BlogData> bList = [];
    if (jsonData != null) {
      List<dynamic> blogJsonData = jsonData["blogs"];
      for (var element in blogJsonData) {
        bList.add(BlogData.fromJson(element));
      }
      StorageHelper.saveList(bList);
      blogList.value = bList;
      isLoading = false;
      return;
    }
    else{
      var list = await StorageHelper.loadList();      
      blogList.value = list.cast<BlogData>();
      isLoading = false;
      return;
    }
  }
}
