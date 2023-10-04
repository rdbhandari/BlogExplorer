import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../Hive/blogs.dart';
import '../Hive/boxes.dart';
import '../components/loadingWidget.dart';

class BlogScreen extends StatefulWidget {
  final String blogId, imgUrl, title;
  const BlogScreen(
      {super.key,
      required this.blogId,
      required this.imgUrl,
      required this.title});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  late bool isFav;
  late Blogs b;

  @override
  void initState() {
    super.initState();
    b = boxBlogs.get(widget.blogId);
    isFav = b.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Blog ",
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "Explorer",
              style: TextStyle(
                  color: Color.fromARGB(255, 88, 196, 15),
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: CachedNetworkImage(
                imageUrl: widget.imgUrl,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    loading2(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _toggleFav,
          backgroundColor: Colors.yellow,
          child: isFav
              ? const Icon(Icons.favorite, color: Colors.red)
              : const Icon(Icons.favorite_border, color: Colors.red)),
    );
  }

  void _toggleFav() {
    setState(() {
      isFav = !isFav;
      b.isFavorite = isFav;
    });
  }
}
