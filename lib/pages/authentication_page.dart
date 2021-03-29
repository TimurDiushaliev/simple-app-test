import 'package:flutter/material.dart';
import 'package:simpleapptest/controller/authentication_service.dart';

class AuthenticationPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        TextFormField(
          controller: emailController,
        ),
        TextFormField(
          controller: passwordController,
        ),
        MaterialButton(
          color: Colors.black,
          child: Text(
            'Войти',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            AuthenticationService.signIn(
                email: emailController.text, password: passwordController.text);
          },
        )
      ],
    );
  }
}
