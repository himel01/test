import 'package:flutter/material.dart';
import 'package:untitled_test/screens/login.dart';
import 'package:untitled_test/screens/sign_up.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool splash = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        splash = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: !splash
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "TestMe",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: w * 0.09,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: h * 0.03,
                      width: w * .4,
                      color: Colors.black,
                      child: Text(
                        "User Authentication",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: w * 0.03,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Container(
                height: h,
                width: w,
                child: Column(
                  children: [
                    SizedBox(
                      height: h * .5,
                    ),
                    Container(
                      child: Text(
                        "TestMe",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: w * 0.09,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: h * 0.03,
                      width: w * .4,
                      color: Colors.black,
                      child: Text(
                        "User Authentication",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: w * 0.03,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.05,
                    ),
                    SizedBox(
                        width: w * 0.8,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Login();
                            }));
                          },
                          child: Text("Login"),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                          ),
                        )),
                    SizedBox(
                        width: w * 0.8,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SignUp();
                            }));
                          },
                          child: Text(
                            "Sign uo",
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                        )),
                  ],
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("asset/image/pic2.jpg"),
                        fit: BoxFit.cover)),
              ));
  }
}
