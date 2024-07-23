// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

void login(String email, password) async {
  try {
    Response response = await post(Uri.parse('https://reqres.in/api/register'),
        body: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      print('Account Created Successfuly');
    } else {
      print('Failed');
    }
  } catch (e) {
    print(e.toString());
  }
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp Api'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                login(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                height: 50,
                child: Center(
                  child: Text('Signup'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
