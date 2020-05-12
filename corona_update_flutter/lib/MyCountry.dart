import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MyCountry extends StatefulWidget {
  @override
  MyCountryCases createState() => MyCountryCases();
}

class MyCountryCases extends State<MyCountry> {
  String globalCases = "", globalRecovered = "", globalDeaths = "";
  String country = "",
      cases = "",
      todayCases = "",
      deaths = "",
      todayDeaths = "",
      recovered = "",
      active = "",
      critical = "",
      casesPerMillion = "",
      deathsPerMillion = "",
      totalTests = "",
      testsPerMillion = "";

  @override
  void initState() {
    getGlobalCoronaUpdate();
  }

  getGlobalCoronaUpdate() async {
    String baseUrl =
        "https://coronavirus-19-api.herokuapp.com/countries/pakistan";

    // make request
    Response response = await get(baseUrl);
    // sample info available in response
    int statusCode = response.statusCode;
    Map<String, String> headers = response.headers;
    String contentType = headers['content-type'];
    String json = response.body;
    json = json;
    if (response.statusCode == 200) {
      try {
        Map<String, dynamic> map = jsonDecode(json); // import 'dart:convert';



        setState(() {
          country = map["country"].toString();
          cases = map["cases"].toString();
          todayCases = map["todayCases"].toString();
          deaths = map["deaths"].toString();
          todayDeaths = map["todayDeaths"].toString();
          recovered = map["recovered"].toString();
          active = map["active"].toString();
          critical = map["critical"].toString();
          casesPerMillion = map["casesPerOneMillion"].toString();
          deathsPerMillion = map["deathsPerOneMillion"].toString();
          totalTests = map["totalTests"].toString();
          testsPerMillion = map["testsPerOneMillion"].toString();
        });

        /*JSONObject reader = new JSONObject(json);
        if (reader.getString("code").equals("200")) {

          OTP = reader.getString("content");
        }*/
      } catch (Exception) {
        //CustomAlert("Oops! Something went wrong.");
      }
    }
    // TODO convert json to object...
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[
          new Padding(
            padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
            child: new Text(
              country,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                  fontSize: 26.0,
                  fontStyle: FontStyle.italic),
            ),
          ),
          new Padding(
              padding: EdgeInsets.fromLTRB(60, 80, 0, 0),
              child: Row(
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: new Text(
                      "Cases: " + cases + "  |  ",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontSize: 12.0),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: new Text(
                      "Today: " + todayCases + "  |  ",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontSize: 12.0),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: new Text(
                      "Active: " + active,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontSize: 12.0),
                    ),
                  ),
                ],
              )),
          new Padding(
              padding: EdgeInsets.fromLTRB(60, 10, 0, 0),
              child: Row(
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: new Text(
                      "Deaths: " + deaths + "  |  ",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontSize: 12.0),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: new Text(
                      "Today: " + todayDeaths,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontSize: 12.0),
                    ),
                  ),
                ],
              )),
          new Padding(
              padding: EdgeInsets.fromLTRB(60, 10, 0, 0),
              child: Row(
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: new Text(
                      "Recovered: " + recovered + "  |  ",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontSize: 12.0),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: new Text(
                      "Critical: " + critical,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontSize: 12.0),
                    ),
                  ),
                ],
              )),
          new Padding(
              padding: EdgeInsets.fromLTRB(60, 10, 0, 0),
              child: Row(
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: new Text(
                      "Cases per million: " + casesPerMillion + "  |  ",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontSize: 12.0),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: new Text(
                      "Deaths per million: " + deathsPerMillion,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontSize: 12.0),
                    ),
                  ),
                ],
              )),
          new Padding(
              padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
              child: Row(
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: new Text(
                      "Total tests: " + totalTests + "  |  ",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontSize: 12.0),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: new Text(
                      "Tests per million: " + testsPerMillion,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontSize: 12.0),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
    return null;
  }
}
