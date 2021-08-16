import 'package:flutter/material.dart';
import 'package:list_movies/services/auth.dart';
import 'package:list_movies/shared/loading.dart';

class Register extends StatefulWidget {
  Function toggleView;
  Register({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String pass = '';
  String error = '';
  bool loading= false;
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
        backgroundColor: Colors.red[100],
        appBar: AppBar(
          backgroundColor: Colors.red[400],
          title: Text('List Movies Sign Up'),
          elevation: 0.0,
          actions: [
            TextButton.icon(
              onPressed: (){
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Sign In'),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white)
              ),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Enter your email'
                  ),
                  validator: (val)=> val!.isEmpty ? 'Enter an email' : null,
                  onChanged: (val){
                    setState(()=>email=val);
                  },

                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter a password',
                  ),
                  validator: (val)=> val!.length<6 ? 'Enter a password atleast 6 characters long' : null,
                  obscureText: true,
                  onChanged: (val){
                    setState(()=>pass=val);
                  },
                ),
                SizedBox(height: 20.0,),
                ElevatedButton(
                  onPressed: () async {
                    if(_formKey.currentState!.validate()){
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.registerWithEmailAndPass(email, pass);
                      if(result==null){
                        setState(() {
                          loading=false;
                          error='Please enter a valid email and password.';
                        });
                      }
                    }
                  },
                  child: Text('Register'),
                ),
                SizedBox(height: 20.0,),
                Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
