import 'package:flutter/material.dart';
import 'package:list_movies/models/movie.dart';

class EditMovie extends StatefulWidget {
  const EditMovie({Key? key}) : super(key: key);

  @override
  _EditMovieState createState() => _EditMovieState();
}

class _EditMovieState extends State<EditMovie> {
  String movie='';

  String director='';

  String img='';

  Map mydata={};


  @override
  Widget build(BuildContext context) {
    mydata=ModalRoute.of(context)!.settings.arguments as Map;
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
                initialValue: mydata['data'].name,
                decoration: InputDecoration(
                  hintText: mydata['data'].name,
                ),
                onChanged: (val) {
                  setState(() {
                    movie=val;
                  });
                },
              ),
              SizedBox(height: 12.0,),
              TextFormField(
                initialValue: mydata['data'].director,
                decoration: InputDecoration(
                  hintText: mydata['data'].director,
                ),
                onChanged: (val) {
                  setState(() {
                    director=val;
                  });
                },
              ),
              SizedBox(height: 25.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton.icon(
                    onPressed: (){
                      if(movie==''){
                        movie=mydata['data'].name;
                      }
                      if(director==''){
                        director=mydata['data'].director;
                      }
                      if(img==''){
                        img=mydata['data'].img;
                      }
                      mydata['edit'](mydata['data'],Movie(
                        name:movie,
                        director: director,
                        img:mydata['data'].img,
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
