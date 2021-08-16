import 'package:flutter/material.dart';
import 'package:list_movies/screens/Authenticate/register.dart';
import 'package:list_movies/screens/Authenticate/sign_in.dart';

class Authh extends StatefulWidget {
  const Authh({Key? key}) : super(key: key);

  @override
  _AuthhState createState() => _AuthhState();
}

class _AuthhState extends State<Authh> {
  bool showSignIn = true;
  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    return showSignIn?SignIn(toggleView:toggleView):Register(toggleView:toggleView);
  }
}
