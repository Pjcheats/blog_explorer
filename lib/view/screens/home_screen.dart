import 'package:blog_explorer/controllers/blog_controller.dart';
import 'package:blog_explorer/view/widgets/blog_list_item.dart';
import 'package:blog_explorer/view/widgets/blog_list_skeleton.dart';
import 'package:blog_explorer/view/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BlogController _blogController = BlogController();

  @override
  void initState() {
    super.initState();
    _blogController.getBlogs();
  }

  bool _showFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(
        actionsChild: IconButton(
          icon: Icon(
            _showFavourite ? Icons.favorite :  Icons.favorite_border ,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _showFavourite = !_showFavourite;
            });
          },
        ),
        child: Row(
          children: [
            Image.asset(
              "assets/blog-explorer-logo.png",
              height: 24,
            ),
            const Spacer(),
            const SizedBox(
              width: 10,
            ),
            Text(
              _showFavourite ? "favorites" : "explore",
              style:
                  const TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
            ),
            const Spacer(),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/home-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.black.withOpacity(0.85),
          child: Obx(
            () {
              if (_blogController.blogList.isEmpty) {
                if (!_blogController.isLoading) {
                  Center(
                    child: Text(
                  "Check your Internet connection and try again",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.withOpacity(.5)),
                ));
                }
                return const BlogListSkeleton();
              }
              if (_showFavourite && BlogController.favortieBlogList.isEmpty) {
                return Center(
                    child: Text(
                  "No Favourites",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.withOpacity(.5)),
                ));
              }
              
              return ListView.builder(
                itemCount: (_showFavourite
                        ? BlogController.favortieBlogList
                        : _blogController.blogList)
                    .length,
                itemBuilder: (context, index) => BlogListItem(
                    blogData: _showFavourite
                        ? BlogController.favortieBlogList.elementAt(index)
                        : _blogController.blogList[index]),
              ).animate().fadeIn().slideX();
            },
          ),
        ),
      ),
    );
  }
}
