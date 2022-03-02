import 'package:flutter/material.dart';
import 'package:flutter_social_application/data/data.dart';
import 'package:flutter_social_application/models/user_model.dart';

class FollowingUser extends StatelessWidget {
  const FollowingUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          child: Text(
            'Following',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        ),
        Container(
            height: 80.0,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: (context, index) {
                User user = users[index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                        border: Border.all(
                          width: 2.0,
                          color: Theme.of(context).primaryColor,
                        )),
                    margin: EdgeInsets.all(10.0),
                    child: ClipOval(
                      child: Image(
                        height: 60.0,
                        width: 60.0,
                        fit: BoxFit.cover,
                        image: AssetImage(user.profileImageUrl),
                      ),
                    ),
                  ),
                );
              },
            ))
      ],
    );
  }
}
