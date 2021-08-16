import 'package:flutter/material.dart';
import 'package:list_movies/models/user.dart';
import 'package:list_movies/screens/Authenticate/authh.dart';
import 'package:list_movies/screens/Home/add_movie.dart';
import 'package:list_movies/screens/Home/edit_movie.dart';
import 'package:list_movies/screens/Home/home.dart';
import 'package:list_movies/services/auth.dart';
import 'package:list_movies/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: App(),
  ));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return StreamProvider<MyUser?>.value(
      initialData: null,
      value: AuthService().user ,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/':(context)=>Wrapper(),
          '/home':(context)=>Home(),
          '/addmovie':(context)=>AddMovie(),
          '/editmovie':(context)=>EditMovie(),
        },
      ),
    );
  }
}
