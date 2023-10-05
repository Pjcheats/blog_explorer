import 'package:blog_explorer/controllers/blog_controller.dart';
import 'package:blog_explorer/models/blog_data.dart';
import 'package:blog_explorer/view/screens/description_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BlogListItem extends StatefulWidget {
  const BlogListItem({
    super.key,
    required this.blogData,
  });

  final BlogData blogData;

  @override
  State<BlogListItem> createState() => _BlogListItemState();
}

class _BlogListItemState extends State<BlogListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DescriptionScreen(blogData: widget.blogData),
            ));
      },
      child: Container(
        height: 200,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              widget.blogData.imageUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(
                  BlogController.checkFavorite(widget.blogData) ? Icons.favorite :  Icons.favorite_border ,
                  color: BlogController.checkFavorite(widget.blogData) ? Colors.pink.shade600 : Colors.white,
                ),
                onPressed: () {
                  BlogController.toggleFavorite(widget.blogData);
                  setState(() {});
                },
              ),
            ),
            Hero(
              tag: widget.blogData.id,
              child: Container(
                padding: const EdgeInsets.all(5),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black])),
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    widget.blogData.title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
