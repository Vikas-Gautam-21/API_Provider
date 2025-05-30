class Post {
    Post({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    final int userId;
    final int id;
    final String title;
    final String body;

    factory Post.fromJson(Map<String, dynamic> json){ 
        return Post(
            userId: json["userId"],
            id: json["id"],
            title: json["title"],
            body: json["body"],
        );
    }

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };

}
