import 'package:flutter/material.dart';
import 'package:simpleapptest/controller/authentication_service.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.15),
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: 'Ваш email',
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          validator: (value) {
            final emailValidation = RegExp(
                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
            if (!value.contains(emailValidation))
              return 'Укажите правильный email адрес:example@example.com';
            return '';
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        TextFormField(
          controller: passwordController,
          decoration: InputDecoration(
            hintText: 'Ваш пароль',
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          validator: (value) {
            if (value.length < 6)
              return 'Пароль должен содержать не менее 6 символов';
            return '';
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        MaterialButton(
          color: Colors.black,
          child: Text(
            'Войти',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            if (formKey.currentState.validate())
              AuthenticationService.signIn(
                  email: emailController.text,
                  password: passwordController.text);
          },
        )
      ],
    );
  }
}
