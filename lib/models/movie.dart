import 'dart:io';
class Movie{
  String name;
  String? director;
  String? img;
  File? image;
  Function? deleteObject;
  Movie({required this.name,this.director,this.img,this.image,this.deleteObject});
}