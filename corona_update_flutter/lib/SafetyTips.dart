import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SafetyTips extends StatefulWidget {
  @override
  SafetyTipsUI createState() => SafetyTipsUI();
}

class SafetyTipsUI extends State<SafetyTips> {
  String heading = "To prevent the spread of COVID-19:",
      tip1 =
          "1. Clean your hands often. Use soap and water, or an alcohol-based hand rub.",
      tip2 =
          "2. Maintain a safe distance from anyone who is coughing or sneezing.",
      tip3 = "3. Don’t touch your eyes, nose or mouth.",
      tip4 =
          "4. Cover your nose and mouth with your bent elbow or a tissue when you cough or sneeze.",
      tip5 = "5. Stay home if you feel unwell.",
      tip6 =
          "6. If you have a fever, cough and difficulty breathing, seek medical attention. Call in advance.",
      tip7 = "7. Follow the directions of your local health authority.";

  @override
  void initState() {}

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double screenHeight(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).height / dividedBy;
  }

  double screenWidth(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).width / dividedBy;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        child: Flex(direction: Axis.horizontal, children: [
      Expanded(
        child: Column(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: new Text(
                heading,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic),
              ),
            ),
            new Padding(
                padding: EdgeInsets.fromLTRB(30, 80, 0, 0),
                child: Row(
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: SizedBox(
                        width: screenWidth(context) - 30,
                        child: Text(
                          tip1,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: false,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black38,
                              fontSize: 12.0),
                        ),
                      ),
                    ),
                  ],
                )),
            new Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Row(
                  children: <Widget>[
                    new Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: SizedBox(
                          width: screenWidth(context) - 30,
                          child: new Text(
                            tip2,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black38,
                                fontSize: 12.0),
                          ),
                        )),
                  ],
                )),
            new Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Row(
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: SizedBox(
                        width: screenWidth(context) - 30,
                        child: new Text(
                          tip3,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black38,
                              fontSize: 12.0),
                        ),
                      ),
                    ),
                  ],
                )),
            new Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Row(
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: SizedBox(
                        width: screenWidth(context) - 30,
                        child: new Text(
                          tip4,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black38,
                              fontSize: 12.0),
                        ),
                      ),
                    ),
                  ],
                )),
            new Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Row(
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: SizedBox(
                        width: screenWidth(context) - 30,
                        child: new Text(
                          tip5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black38,
                              fontSize: 12.0),
                        ),
                      ),
                    ),
                  ],
                )),
            new Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Row(
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: SizedBox(
                        width: screenWidth(context) - 30,
                        child: new Text(
                          tip6,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black38,
                              fontSize: 12.0),
                        ),
                      ),
                    ),
                  ],
                )),
            new Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Row(
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: SizedBox(
                        width: screenWidth(context) - 30,
                        child: new Text(
                          tip7,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black38,
                              fontSize: 12.0),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      )
    ])),);
    return null;
  }
}
