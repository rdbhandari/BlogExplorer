// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blogs.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlogsAdapter extends TypeAdapter<Blogs> {
  @override
  final int typeId = 1;

  @override
  Blogs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Blogs(
      blogId: fields[0] as String,
      title: fields[1] as String,
      imgUrl: fields[2] as String,
      isFavorite: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Blogs obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.blogId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.imgUrl)
      ..writeByte(3)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlogsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
