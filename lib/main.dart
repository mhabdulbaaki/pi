import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


void main() => runApp(MyAppBody());

class MyAppBody extends StatefulWidget {
  @override
  _MyAppBodyState createState() => _MyAppBodyState();
}

class _MyAppBodyState extends State<MyAppBody> {

  void onAlertButtonPressed(context) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "Finish",
      desc: "Questions exhausted",
      buttons: [
        DialogButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }


  final TextEditingController piHolder = TextEditingController(text: '3');
  static String myPI =
      '''3.14159265358979323846264338327950288419716939937510582097494459230781640628620
  89986280348253421170679821480865132823066470938446095505822317253594081284811174''';

  static int numberOfDecimal = 3;
  String piSubString = myPI.substring(2, 5);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  child: Text(
                    'First $numberOfDecimal decimal digits of pi',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.blueGrey.shade500,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '3.$piSubString',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.blueGrey.shade500,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: new TextField(
                        controller: piHolder,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          hintText: 'Enter Number',
                          labelText: ''
                              '',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    FlatButton(
                      child: Icon(
                        Icons.send,
                        color: Colors.lightBlue,
                        size: 60,
                      ),
                      onPressed: () {
                        setState(() {
                          numberOfDecimal = int.parse(piHolder.text);
                          if(numberOfDecimal > myPI.length ){
                            onAlertButtonPressed(context);
                          }
                          piSubString = myPI.substring(2, 2 + numberOfDecimal);
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
