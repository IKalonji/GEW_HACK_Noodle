import 'package:flutter/material.dart';
import 'package:masi/commons/colors.dart';
import 'package:masi/view/camera.dart';

class TakeAID extends StatefulWidget {
  final camera;
  TakeAID({Key? key,this.camera}) : super(key: key);

  @override
  _TakeASelfieState createState() => _TakeASelfieState();
}

class _TakeASelfieState extends State<TakeAID> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("Let's get you onboarding",
                      style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey)
              ),
            ),
             SizedBox(height: 20,),
            Container(
              child: Text("Please take a picture of your ID",
                      style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 20.0,
                      color: Colors.blueGrey)
              ),
            ),
            SizedBox(height: 20,),
            Container(
              color: Colors.white,
              child: Image(image: AssetImage('images/id4.png'),)
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
                            isSelfie: false,
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