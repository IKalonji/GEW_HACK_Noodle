import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:masi/commons/colors.dart';
import 'package:masi/view/TakeAID.dart';

class HomePage extends StatefulWidget {
  final camera;
  HomePage({Key? key, @required this.camera}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController mobileNumber = TextEditingController();
  bool isNumberFilled = false;
  bool _agreedToTOS = false;
  
  void _setAgreedToTOS(bool newValue) {
    setState(() {
      _agreedToTOS = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          child: Center(
            child: Container(
                height: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Noodle Funeral Cover",
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Get covered in less than 2 minutes!",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w100,
                            color: Colors.white)),
                  ],
                )),
          ),
          elevation: 8,
          color: mainColor,
          shadowColor: Colors.black38,
          margin: EdgeInsets.all(0),
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey, width: 1)),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.only(left: 8, right: 10, top: 10, bottom: 10),
          child: Text("Please make sure that, the entered number is callable.",
          style: TextStyle(color: Colors.grey),
          ),
        ),
        Form(
          key: _formkey,
          child: Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 20),
            child: TextFormField(
              controller: mobileNumber,
              maxLength: 10,
              
              keyboardType: TextInputType.phone,
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                counterText: "",
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: mainColor, width: 0.0),
                ),
                border: OutlineInputBorder(),
                labelText: "Mobile Number",
                labelStyle:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.amberAccent, width: 2.0),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Mobile Number field can't be empty.";
                }
                if (value.length != 10) {
                  return "Invalid Number";
                }
                return null;
              },
            ),
          ),
        ),

        SizedBox(
          height: 20,
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(width: 1.0, color: mainColor),
            primary: Colors.white,
            backgroundColor: mainColor,
            minimumSize: Size(320, 50),
          ),
          child: Text('Countinue'),
          onPressed: () {
            if (!_formkey.currentState!.validate()) {
              return;
            }
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TakeAID(camera: widget.camera,)),
            );
          },
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
            padding: const EdgeInsets.only(left:18),
            child: Row(
              children: <Widget>[
              Checkbox(
              value: _agreedToTOS,
              onChanged: (value) {
                  setState(() {
                    _agreedToTOS = value!;
                  });
                },
              ),
                GestureDetector(
                  onTap: () => _setAgreedToTOS(!_agreedToTOS),
                  child: const Text(
                    'I agree to the Terms of Services and Privacy Policy',
                        style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w100,
                        )
                  ),
                ),
              ],
            ),
        ),

      ],
    )));
  }
}


