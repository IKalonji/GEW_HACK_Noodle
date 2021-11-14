import 'package:flutter/material.dart';
import 'package:masi/commons/colors.dart';
import 'package:masi/services/services.dart';
import 'package:masi/view/homaPage.dart';

class VoiceAPI extends StatefulWidget {
  VoiceAPI({Key? key}) : super(key: key);

  @override
  _VoiceAPIState createState() => _VoiceAPIState();
}

class _VoiceAPIState extends State<VoiceAPI> {
  Services services = Services();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("Almost There.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      color: Colors.blueGrey)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                  "Press countinue to receive a finalising call from our agent.",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w100,
                      color: Colors.blueGrey)),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
                color: Colors.white,
                child: Image(
                  image: AssetImage('images/call2.png'),
                )),
            SizedBox(
              height: 40,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(width: 1.0, color: mainColor),
                primary: Colors.white,
                backgroundColor: mainColor,
                minimumSize: Size(320, 50),
              ),
              child: Text('Click To Receive Call'),
              onPressed: () {

                services.getCall();

                Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MainPage()),
            );
              },
            ),
          ],
        ),
      ),
    );
  }
}
