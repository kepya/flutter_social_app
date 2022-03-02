import 'package:flutter/material.dart';
import 'package:flutter_social_application/data/data.dart';
import 'package:flutter_social_application/screens/home_screen.dart';
import 'package:flutter_social_application/screens/login_screen.dart';
import 'package:flutter_social_application/screens/profil_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  _buildDrawerOption(Icon icon, String title, Function() onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Stack(
          children: [
            Image(
              fit: BoxFit.cover,
              height: 200.0,
              width: double.infinity,
              image: AssetImage(currentUser.backgroundImageUrl),
            ),
            Positioned(
              bottom: 20.0,
              left: 20.0,
              child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 3.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  child: ClipOval(
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(currentUser.profileImageUrl),
                    ),
                  ),
                ),
                SizedBox(
                  width: 6.0,
                ),
                Text(
                  currentUser.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                )
              ]),
            )
          ],
        ),
        _buildDrawerOption(
          Icon(Icons.dashboard),
          'Home',
          () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) {
                return HomeScreen();
              },
            ),
          ),
        ),
        _buildDrawerOption(
          Icon(Icons.chat),
          'Chat',
          () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) {
                return HomeScreen();
              },
            ),
          ),
        ),
        _buildDrawerOption(
          Icon(Icons.location_on),
          'Map',
          () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) {
                return HomeScreen();
              },
            ),
          ),
        ),
        _buildDrawerOption(
          Icon(Icons.account_circle),
          'Your Profile',
          () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) {
                return ProfilScreen(
                  user: currentUser,
                );
              },
            ),
          ),
        ),
        _buildDrawerOption(
          Icon(Icons.settings),
          'Settings',
          () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) {
                return HomeScreen();
              },
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: _buildDrawerOption(
              Icon(Icons.directions_run),
              'Logout',
              () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return LoginScreen();
                  },
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
