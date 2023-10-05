class BlogData {
    String id;
    String imageUrl;
    String title;

    BlogData({
        required this.id,
        required this.imageUrl,
        required this.title,
    });

    factory BlogData.fromJson(Map<String, dynamic> json) => BlogData(
        id: json["id"],
        imageUrl: json["image_url"],
        title: json["title"]
      ); 
}
