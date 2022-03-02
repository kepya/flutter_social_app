import 'package:flutter_social_application/models/post_model.dart';

class User {
  String profileImageUrl;
  String backgroundImageUrl;
  String name;
  int following;
  int followers;
  List<Post> posts;
  List<Post> favorites;

  User({
    required this.profileImageUrl,
    required this.backgroundImageUrl,
    required this.name,
    required this.following,
    required this.followers,
    required this.posts,
    required this.favorites,
  });

  // User(this.profileImageUrl, this.backgroundImageUrl, this.name, this.following,
  //     this.followers, this.posts, this.favorites);

}
