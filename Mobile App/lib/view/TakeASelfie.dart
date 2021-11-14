
import 'package:flutter/material.dart';
import 'package:masi/commons/colors.dart';
import 'package:masi/view/camera.dart';

class TakeASelfie extends StatefulWidget {
  final camera;
  final name;
  TakeASelfie({Key? key, this.camera,this.name}) : super(key: key);

  @override
  _TakeASelfieState createState() => _TakeASelfieState();
}

class _TakeASelfieState extends State<TakeASelfie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
              child: Text("Welcome " + widget.name,
                      style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w100,
                      color: Colors.blueGrey)
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: Text("Verify Your Identity By",
                      style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey)
              ),
            ),
             SizedBox(height: 20,),
            Container(
              child: Text("Taking a selfie",
                      style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 20.0,
                      color: Colors.blueGrey)
              ),
            ),
            SizedBox(height: 20,),
            Container(
              color: Colors.white,
              child: Image(image: AssetImage('images/selfie2.png'),)
            ),
            SizedBox(height: 40,),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(width: 1.0, color: mainColor),
                primary: Colors.white,
                backgroundColor: mainColor,
                minimumSize: Size(320, 50),
              ),
              child: Text('Countinue'),
              onPressed: () {
     
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TakePictureScreen(
                            camera: widget.camera,
                            isSelfie: true,
                          )),
                );
              },
            ),
            
          ],
        ),
      ),
    );
  }
}