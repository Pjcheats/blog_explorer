import 'package:blog_explorer/models/blog_data.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BlogDataAdapter extends TypeAdapter<BlogData> {
  @override
  final int typeId = 1; // Unique ID for this type adapter

  @override
  BlogData read(BinaryReader reader) {
    final id = reader.readString();
    final title = reader.readString();
    final imageUrl = reader.readString();
    return BlogData(id: id, title: title, imageUrl: imageUrl);
  }

  @override
  void write(BinaryWriter writer, BlogData obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.imageUrl);
  }
}
