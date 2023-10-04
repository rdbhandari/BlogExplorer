import 'package:blogexplorer/provider/isLoadingProvider.dart';
import 'package:blogexplorer/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'Hive/blogs.dart';
import 'Hive/boxes.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BlogsAdapter());
  boxBlogs = await Hive.openBox<Blogs>('blogsbox');

  runApp(ChangeNotifierProvider(
    create: (context) => HomeScreenProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog Explorer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Poppins'),
      home: const HomeScreen(),
    );
  }
}
