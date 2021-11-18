import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
      body: Column(
        children: [
          SizedBox(
            height: h * 0.05,
          ),
          Container(
            width: w,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: w * 0.03),
            child: Text(
              "Login",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: w * 0.07,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: h * 0.02,
          ),
          Container(
            margin: EdgeInsets.only(left: w * 0.03),
            child: Text(
              "Enter your email address and password to access your account",
              style: TextStyle(
                color: Colors.black26,
                fontSize: w * 0.05,
                //fontWeight: FontWeight.bold),
              ),
            ),
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
          SizedBox(
              width: w * 0.96,
              height: h * 0.055,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Login();
                  }));
                },
                child: Text("Login"),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
              )),
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?"),
              SizedBox(
                width: w * 0.03,
              ),
              Text("Sign Up"),
              SizedBox(
                height: h * 0.1,
              )
            ],
          )
        ],
      ),
    );
  }
}
