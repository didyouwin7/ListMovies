import 'package:flutter/material.dart';
import 'package:list_movies/services/auth.dart';
import 'package:list_movies/models/movie.dart';

class Home extends StatefulWidget {
  //const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Movie> movies= [
    Movie(
      name:'Spiderman',
      director:'Director',
      img:'https://raw.githubusercontent.com/didyouwin07/HelperYellowClassVishwas/main/img01.JPG',
      //image:Image.asset('images/img01.JPG')
    ),
    Movie(
        name:'Batman',
        director:'Director',
        img:'https://raw.githubusercontent.com/didyouwin07/HelperYellowClassVishwas/main/img02.JPG'
    ),
    Movie(
        name:'Superman',
        director:'Director',
        img:'https://raw.githubusercontent.com/didyouwin07/HelperYellowClassVishwas/main/img03.JPG'
    )
  ];

  Widget MovieCard(Movie){
    return Card(
      margin: EdgeInsets.fromLTRB(20.0, 5.0, 12.0, 15.0),
      child: Column(
        children: [
          SizedBox(height: 10.0,),
          CircleAvatar(
            backgroundImage: NetworkImage(Movie.img),
            radius: 60.0,
          ),
          SizedBox(height: 12.0,),
          Text(
            Movie.name,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(height: 12.0,),
          Text(Movie.director),
          SizedBox(height: 12.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                onPressed: (){
                  //function to edit the current item
                  Navigator.pushNamed(context, '/editmovie',arguments: {
                    'data':Movie,
                    'edit':editMovie
                  });
                },
                icon: Icon(Icons.edit),
                label: Text('Edit'),
              ),
              TextButton.icon(
                onPressed: (){
                  //function to delete the current item
                  setState(() {
                    movies.remove(Movie);
                  });


                },
                icon: Icon(Icons.delete),
                label: Text('Delete'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Function? editMovie(Movie old,Movie nayi){
    movies.remove(old);
    movies.add(Movie(
      name:nayi.name,
      director:nayi.director,
      img:nayi.img
    ));
    setState(() {

    });
  }

  Function? addFunc(Movie nayi){
    movies.add(nayi);
    setState(() {

    });
  }

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text('List Movies'),
        actions: [
          TextButton.icon(
              onPressed: () async {
                _auth.logOut();
              },
              icon: Icon(Icons.person),
            label: Text('logout'),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white)
            ),
          ),
        ],
      ),
      body: ListView(
        children: movies.map((Movie)=>MovieCard(Movie)).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[400],
        onPressed: (){
            Navigator.pushNamed(context, '/addmovie',arguments: {
              'addFunc':addFunc,
            });
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
