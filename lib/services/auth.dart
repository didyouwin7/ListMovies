import 'package:firebase_auth/firebase_auth.dart';
import 'package:list_movies/models/user.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //custom user
  MyUser? _userFromFirebaseUser(User? user){
    return user != null ? MyUser(uid:user.uid):null;
  }

  Stream<MyUser?> get user{
    return _auth.authStateChanges()
        .map((User? user)=> _userFromFirebaseUser(user));
  }
  //anonymous sign in
  Future signInAnon() async{
    try{
     UserCredential result= await _auth.signInAnonymously();
     User? user = result.user;
     return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailAndPass(String email, String pass) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
        print(e.toString());
        return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailAndPass(String email, String pass) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: pass);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future logOut() async {
    try{
      return _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }

  }

}