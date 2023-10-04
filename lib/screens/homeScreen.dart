import 'package:blogexplorer/provider/isLoadingProvider.dart';
import 'package:blogexplorer/services/fetchBlogs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Hive/blogs.dart';
import '../Hive/boxes.dart';
import '../components/blogTile.dart';
import '../components/connectionCheck.dart';
import '../components/loadingWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController scrollController;
  List<Blogs> blogs = [];
  int blogCount = 0;

  @override
  void initState() {
    super.initState();
    callMeFirst();

    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        loadBlogs(10);
      }
    });
    connectivityCheck(context);
    checkRealtimeConnection(context);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
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
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w600),
              ),
              Text(
                "Explorer",
                style: TextStyle(
                    color: Color.fromARGB(255, 88, 196, 15),
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        body: Consumer<HomeScreenProvider>(builder: (context, value, child) {
          return value.isLoading
              ? loading1()
              : ListView.builder(
                  itemCount: blogs.length,
                  shrinkWrap: true,
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    return BlogTile(
                        imageUrl: blogs[index].imgUrl,
                        title: blogs[index].title,
                        id: blogs[index].blogId,
                        index: index.toString());
                  });
        }));
  }

  void callMeFirst() async {
    fetchBlogs().then((value) => loadBlogs(15)).then((value) =>
        Provider.of<HomeScreenProvider>(context, listen: false)
            .setLoading(false));
  }

  void loadBlogs(int count) {
    if (blogs.length < boxBlogs.length) {
      for (int i = 0; i < count; i++) {
        blogs.add(boxBlogs.getAt(blogs.length + i));
      }
      setState(() {
        blogs;
      });
    }
  }
}
