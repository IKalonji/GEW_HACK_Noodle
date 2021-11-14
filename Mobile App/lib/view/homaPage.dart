
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     appBar: AppBar(
       leading: Icon(Icons.logout_outlined,color: Colors.white,),
       backgroundColor: Colors.white,
       
     ),
     drawer:Drawer(
       child: Icon(Icons.menu),
     ),
     body: SingleChildScrollView(
       child: Column(
         children: [
            _buildTitleSection(
                title: "Noodle",
                subTitle: "Manage Policies"),
            SizedBox(height: 20,),
            _buildCreditCard(
                color: Colors.grey,
                cardExpiration: "02/12/2022",
                cardHolder: "PENDING",
                cardNumber: "35467532 "),
             SizedBox(height: 20,),
            _buildCreditCard(
                color: Colors.blue,
                cardExpiration: "02/12/2022",
                cardHolder: "PENDING",
                cardNumber: "35467532"),
                SizedBox(height: 20,),
            _buildCreditCard(
                color: Colors.blue,
                cardExpiration: "02/12/2022",
                cardHolder: "PENDING",
                cardNumber: "35467532"),
     
       ],),
     ),


      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Claims',
          ),
          ],
        ),
    );
  }

   Card _buildCreditCard(
      {required Color color,
      required String cardNumber,
      required String cardHolder,
      required String cardExpiration}) {
    return Card(
      elevation: 4.0,
      color: color,
      /*1*/
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: 200,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
        child: Column(
          /*2*/
          crossAxisAlignment: CrossAxisAlignment.start,
          /*3*/
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 0.5,),
            _buildLogosBlock(),
            /* Here we are going to place the _buildLogosBlock */
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              /* Here we are going to place the Card number */
            child: Text(
                'Amount: R 224 pm',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontFamily: 'CourrierPrime'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                /* Here we are going to place the _buildDetailsBlock */
                  _buildDetailsBlock(
                  label: 'STATUS',
                  value: cardHolder,
                ),
                _buildDetailsBlock(
                  label: 'Next Payment',
                  value: cardExpiration,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
    Column _buildDetailsBlock({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$label',
          style: TextStyle(
              color: Colors.amber, fontSize: 9, fontWeight: FontWeight.bold),
        ),
        Text(
          '$value',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
    Column _buildTitleSection({@required title, @required subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 16.0),
          child: Center(
            child: Text(
              '$title',
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
          child:  Divider(
                  height: 3,
                  thickness:5,
                  color: Colors.black,
                  indent: 150,
                  endIndent: 150,
              ),
        )
      ],
    );
  }
    Row _buildLogosBlock() {
    return Row(
      /*1*/
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        
        Text(
          "Policy No: 235445",
          style:TextStyle(
            fontWeight: FontWeight.bold
          )

        ),

      ],
    );
  }
}
