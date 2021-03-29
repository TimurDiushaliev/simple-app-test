import 'package:flutter/material.dart';
import 'package:simpleapptest/controller/authentication_service.dart';
import 'package:simpleapptest/pages/sign_in_page.dart';
import 'package:simpleapptest/pages/sign_up_page.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthenticationService.authStateChanged,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return Center(
            child: MaterialButton(
              color: Colors.black,
              child: Text(
                'Выйти',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                AuthenticationService.signOut();
              },
            ),
          );
        }
        return SignUpPage();
      },
    );
  }
}
