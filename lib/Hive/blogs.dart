import 'package:hive/hive.dart';

part 'blogs.g.dart';

@HiveType(typeId: 1)
class Blogs {
  Blogs(
      {required this.blogId,
      required this.title,
      required this.imgUrl,
      required this.isFavorite});
  @HiveField(0)
  String blogId;

  @HiveField(1)
  String title;

  @HiveField(2)
  String imgUrl;

  @HiveField(3)
  bool isFavorite;
}
