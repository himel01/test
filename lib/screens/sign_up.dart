import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:untitled_test/location_service.dart';
import 'package:untitled_test/model_user.dart';
import 'package:untitled_test/screens/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  File? file;
  int group = 1;
  PickedFile? _image;
  ImagePicker _picker = ImagePicker();
  LocationData? locationData;
  String imagePath = "";
  User? user;
  TextEditingController? name, email, phone, password;

  _imgFromCamera() async {
    _image =
        await _picker.getImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      file = File(_image!.path);
    });
  }

  _imgFromGallery() async {
    _image =
        await _picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      file = File(_image!.path);
    });
  }

  registerUser() {
    if (name!.text.isNotEmpty &&
        email!.text.isNotEmpty &&
        password!.text.isNotEmpty &&
        phone!.text.isNotEmpty &&
        file != null &&
        locationData != null) {
      user = User(
          image: file!,
          name: name!.text,
          email: email!.text,
          latitude: locationData!.latitude.toString(),
          longitude: locationData!.longitude.toString(),
          phone: phone!.text,
          password: password!.text,
          gender: group);
      var uri = Uri.parse('https://conference.bmssystems.org/api/reg');
      var request = http.MultipartRequest('POST', uri);

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    // LocationService().currentLocation().then((value) {
    //   LocationData? l=value;
    //   print(l!.latitude.toString());
    // });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: Colors.blue,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        elevation: 0.0,
        title: Text(
          "Back",
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: w,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: w * 0.03),
              child: Text(
                "Sign Up",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: w * 0.07,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Stack(
              alignment: Alignment.topRight,
              //fit: StackFit.loose,
              // clipBehavior: Clip.antiAliasWithSaveLayer,
              children: [
                InkWell(
                  onTap: () {
                    _imgFromGallery();
                    //_imgFromCamera();
                  },
                  child: file == null
                      ? Container(
                          margin: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.020),
                          height: MediaQuery.of(context).size.width * 0.22,
                          width: MediaQuery.of(context).size.width * 0.22,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blue
                              //borderRadius: BorderRadius.circular(70),

                              //color: Colors.black,
                              ),

                          //child: Image.asset("assets/icon/logo.png"),
                        )
                      : Container(
                          margin: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.020),
                          height: MediaQuery.of(context).size.width * 0.22,
                          width: MediaQuery.of(context).size.width * 0.22,
                          //child: Image.file(file!),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            //borderRadius: BorderRadius.circular(70),
                            image: DecorationImage(
                                image: FileImage(file!), fit: BoxFit.cover),
                          ),
                        ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 25.0, right: 20.0, bottom: 40.0),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    color: Colors.black,
                  ),
                  height: MediaQuery.of(context).size.width * 0.1,
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
              ],
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Container(
              padding: EdgeInsets.all(w * 0.02),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.black12,
                  labelText: 'Name',
                  hintText: 'Enter Your Name',
                ),
              ),
            ),
            SizedBox(
              height: h * 0.0005,
            ),
            Container(
              padding: EdgeInsets.all(w * 0.02),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.black12,
                  labelText: 'Email',
                  hintText: 'Enter Your Email',
                ),
              ),
            ),
            SizedBox(
              height: h * 0.0005,
            ),
            Container(
              padding: EdgeInsets.all(w * 0.02),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.black12,
                  labelText: 'Phone',
                  hintText: 'Enter Your Number',
                ),
              ),
            ),
            SizedBox(
              height: h * 0.0005,
            ),
            Container(
              padding: EdgeInsets.all(w * 0.02),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye_sharp),
                    onPressed: () {},
                  ),
                  filled: true,
                  fillColor: Colors.black12,
                  labelText: 'Password',
                  hintText: 'Enter Your Password',
                ),
              ),
            ),
            SizedBox(
              height: h * 0.06,
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text("Male"),
                    leading: Radio(
                      value: 1,
                      groupValue: group,
                      onChanged: (v) {
                        setState(() {
                          group = v as int;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text("Female"),
                    leading: Radio(
                      value: 2,
                      groupValue: group,
                      onChanged: (a) {
                        setState(() {
                          group = a as int;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
                width: w * 0.96,
                height: h * 0.055,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return Home();
                        }));
                  },
                  child: Text("Sign up"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("already a user?"),
                SizedBox(
                  width: w * 0.03,
                ),
                Text("Login"),
                SizedBox(
                  height: h * 0.1,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
