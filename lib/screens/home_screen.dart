import 'package:flutter/material.dart';
import 'package:flutter_social_application/data/data.dart';
import 'package:flutter_social_application/models/user_model.dart';
import 'package:flutter_social_application/widgets/custom_drawer.dart';
import 'package:flutter_social_application/widgets/following_users.dart';
import 'package:flutter_social_application/widgets/posts_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  var _pageController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          title: Text(
            'FREEZY',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 10.0,
            ),
          ),
          bottom: TabBar(
              controller: tabController,
              labelColor: Theme.of(context).primaryColor,
              labelStyle:
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
              indicatorWeight: 3.0,
              tabs: [
                Tab(
                  text: 'Trending',
                ),
                Tab(
                  text: 'Latest',
                ),
              ]),
        ),
        drawer: CustomDrawer(),
        body: ListView(
          children: [
            FollowingUser(),
            PostsCarousel(
              pageController: _pageController,
              title: 'Posts',
              posts: posts,
            ),
          ],
        ));
  }
}

class BuildPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8.0
      ..color = Colors.red
      ..style = PaintingStyle.stroke;
    double radius = 20;
    Offset c = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(c, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
