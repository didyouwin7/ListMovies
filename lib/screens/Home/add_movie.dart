import 'package:flutter/material.dart';
import 'package:list_movies/models/movie.dart';

class AddMovie extends StatefulWidget {
  const AddMovie({Key? key}) : super(key: key);

  @override
  _AddMovieState createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  String movie='';

  String director='';

  String img='';

  Map? mydata={};

  @override
  Widget build(BuildContext context) {
    mydata = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        title: Text('Add movie'),
        centerTitle: true,
        backgroundColor: Colors.red[400],
      ),
      body: Form(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
          child: Column(
            children: [
              SizedBox(height: 12.0,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter movie name',
                ),
                onChanged: (val) {
                  setState(() {
                    movie=val;
                  });
                },
              ),
              SizedBox(height: 12.0,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter director name',
                ),
                onChanged: (val) {
                  setState(() {
                    director=val;
                  });
                },
              ),
              SizedBox(height: 12.0,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter the link to image',
                ),
                onChanged: (val) {
                  setState(() {
                    img=val;
                  });
                },
              ),
              SizedBox(height: 25.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton.icon(
                    onPressed: (){
                      mydata!['addFunc'](Movie(
                          name: movie,
                        director: director,
                        img:img
                      ));
                      Navigator.of(context).pop();
                    },
                    icon:Icon(Icons.add_task),
                    label: Text('Submit'),
                  ),
                  TextButton.icon(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    icon:Icon(Icons.delete),
                    label: Text('Cancel'),
                  ),

                ],
              )
            ],
          ),
        ),
      ),

    );
  }
}
