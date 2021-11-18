import 'dart:io';

class User{
 final String name,email,latitude,longitude,phone,password;
  final int gender;
  final File image;

  User({required this.image,
      required this.name,
      required this.email,
      required this.latitude,
      required this.longitude,
      required this.phone,
      required this.password,
      required this.gender});


}