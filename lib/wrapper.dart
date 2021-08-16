import 'package:flutter/material.dart';
import 'package:list_movies/models/user.dart';
import 'package:list_movies/screens/Authenticate/authh.dart';
import 'package:list_movies/screens/Authenticate/sign_in.dart';
import 'package:list_movies/screens/Home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //returns home screen if the user is signed in and returns sign in or sign up screen if the user is not signed in
    final user = Provider.of<MyUser?>(context);
    print(user);
    return user == null ? Authh():Home();
  }
}
