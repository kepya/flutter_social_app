import 'package:flutter/material.dart';
import 'package:flutter_social_application/models/user_model.dart';
import 'package:flutter_social_application/widgets/custom_drawer.dart';
import 'package:flutter_social_application/widgets/posts_carousel.dart';
import 'package:flutter_social_application/widgets/profile_clipper.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late PageController _yourPostPagesController;
  late PageController _yourFavoritesPagesController;

  @override
  void initState() {
    super.initState();
    this._yourFavoritesPagesController =
        PageController(initialPage: 0, viewportFraction: 0.8);
    this._yourPostPagesController =
        PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipPath(
                clipper: ProfileClipper(),
                child: Image(
                  height: 300.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  image: AssetImage(widget.user.backgroundImageUrl),
                ),
              ),
              Positioned(
                top: 50.0,
                left: 20.0,
                child: IconButton(
                  icon: Icon(Icons.menu),
                  iconSize: 30.0,
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    return _scaffoldKey.currentState?.openDrawer();
                  },
                ),
              ),
              Positioned(
                bottom: 10.0,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 2),
                          blurRadius: 6.0),
                    ],
                  ),
                  child: ClipOval(
                    child: Image(
                      image: AssetImage(widget.user.profileImageUrl),
                      height: 120.0,
                      width: 120.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
          Text(
            widget.user.name,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Following',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 22.0,
                    ),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    widget.user.following.toString(),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    'Followers',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 22.0,
                    ),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    widget.user.following.toString(),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              )
            ],
          ),
          PostsCarousel(
              pageController: _yourPostPagesController,
              title: 'Your Posts',
              posts: widget.user.posts),
          PostsCarousel(
              pageController: _yourFavoritesPagesController,
              title: 'Favorites',
              posts: widget.user.favorites),
          SizedBox(
            height: 50.0,
          ),
        ],
      )),
    );
  }
}
