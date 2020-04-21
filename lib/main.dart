import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'pi_data.dart';

void main() => runApp(MyAppBody());

class MyAppBody extends StatefulWidget {
  @override
  _MyAppBodyState createState() => _MyAppBodyState();
}

class _MyAppBodyState extends State<MyAppBody> {
  onPressedButton(context) {
    Alert(context: context, title: "Oops ):", desc: "limit is 160").show();
  }

  static PiData piData = PiData();
  final TextEditingController piHolder = TextEditingController(text: '3');
  static int numberOfDecimal = 3;
  String piSubString = piData.getPi().substring(2, 5);
  String displayMessage = 'First $numberOfDecimal decimal digits of pi';

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
                    displayMessage,
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

                            if (numberOfDecimal > piData.getPi().length ||
                                numberOfDecimal < 0) {
                              displayMessage = 'Oops ): limit is 160 digits';
                              onPressedButton(context);
                            } else {
                              piSubString = piData
                                  .getPi()
                                  .substring(2, 2 + numberOfDecimal);
                              displayMessage =
                                  'First $numberOfDecimal decimal digits of pi';
                            }
                          });
                        }),
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
