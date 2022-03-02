import 'package:flutter/material.dart';
import 'package:flutter_social_application/screens/home_screen.dart';
import 'package:flutter_social_application/widgets/curve_clipper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(children: [
            ClipPath(
              clipper: CurveClipper(),
              child: Image(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2.5,
                image: AssetImage('assets/images/login_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'FRENZY',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 34.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 10.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Username',
                  prefixIcon: Icon(
                    Icons.account_box,
                    size: 30.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Password',
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 30.0,
                  ),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 40.0),
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => HomeScreen(),
                ),
              ),
              child: Container(
                height: 45.0,
                margin: EdgeInsets.symmetric(horizontal: 60.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    color: Theme.of(context).primaryColor,
                    height: 80.0,
                    child: Text(
                      'Don\'t have account? Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
