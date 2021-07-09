import 'package:login/Animation/FadeAnimation.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'main.dart';

Future createUser(String uid, String email, String pass) async {
  final response = await http.post(
    Uri.parse('https://bluewitcher.com/api/register'),
    headers: <String, String>{
      'Content-Type': 'application/json;charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': uid,
      'email': email,
      'pass': pass,
    }),
  );
  if (response.body == "registered") {
    return "Success";
  } else {
    return "Fail";
  }
}

void register() {
  runApp(Register());
}

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  String msg;
  var feild1 = TextEditingController();
  var feild2 = TextEditingController();
  var feild3 = TextEditingController();
  var user;
  var pswd;
  var email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeAnimation(
                            1,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-1.png'))),
                            )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.3,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-2.png'))),
                            )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.5,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/clock.png'))),
                            )),
                      ),
                      Positioned(
                        child: FadeAnimation(
                            1.6,
                            Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Center(
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 3.0, left: 30.0, right: 30.0, bottom: 30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          1.8,
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100]))),
                                  child: TextField(
                                    onChanged: (String val) {
                                      user = val;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Username",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                    controller: feild1,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: feild2,
                                    onChanged: (String val) {
                                      email = val;
                                    },
                                    //obscureText:true,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Email",
                                        hintStyle: TextStyle(
                                          color: Colors.grey[400],
                                        )),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: feild3,
                                    onChanged: (String val) {
                                      pswd = val;
                                    },
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle: TextStyle(
                                          color: Colors.grey[400],
                                        )),
                                  ),
                                )
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(
                        2,
                        GestureDetector(
                          onTap: () {
                            check(context);
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ])),
                            child: Center(
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      FadeAnimation(
                        2,
                        GestureDetector(
                          onTap: () {
                            main();
                          },
                          child: Text(
                            'Already Have an Account/Login',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blueGrey),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  check(BuildContext context) async {
    msg = await createUser(user, email, pswd);
    if (msg == "Success") {
      AlertDialog alert = AlertDialog(
        title: const Text('Success'),
        content: Text('User Registration Successful'),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'))
        ],
      ); //"Error: $";
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    } else {
      AlertDialog alert = AlertDialog(
        title: const Text('Error'),
        content: Text('Registration Failed'),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'))
        ],
      ); //"Error: $";
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }
}
