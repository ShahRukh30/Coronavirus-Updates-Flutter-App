import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';


class Global extends StatefulWidget {
  @override
  GlobalCases createState() => GlobalCases();
}

class GlobalCases extends State<Global>{
  String globalCases = "", globalRecovered = "", globalDeaths = "";

  @override
  void initState() {

    getGlobalCoronaUpdate();

  }

  getGlobalCoronaUpdate() async {

    String baseUrl = "https://coronavirus-19-api.herokuapp.com/all";

    // make request
    Response response = await get(baseUrl);
    // sample info available in response
    int statusCode = response.statusCode;
    Map<String, String> headers = response.headers;
    String contentType = headers['content-type'];
    String json = response.body;
    json = json;
    if(response.statusCode == 200){
      try {

        Map<String, dynamic> map = jsonDecode(json); // import 'dart:convert';

        int cases = map['cases'];
        int deaths = map['deaths'];
        int recovered = map['recovered'];

        setState(() {
          globalCases = cases.toString();
          globalDeaths = deaths.toString();
          globalRecovered = recovered.toString();
          recovered = recovered;

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
      new Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: new  Text(
            'Global Coronavirus Updates',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 20.0, fontStyle: FontStyle.italic),
          ),
      ),

      new Padding(padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
        child: new Text("Total Cases",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 24.0, fontStyle: FontStyle.italic, decoration: TextDecoration.underline,
          ),
        ),
      ),

          new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child:new Text(globalCases,

              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 24.0),
            ),
          ),

          new Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child:new Text("Recovered",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 24.0, fontStyle: FontStyle.italic, decoration: TextDecoration.underline),
            ),
          ),

          new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child:new Text(globalRecovered,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 24.0),
            ),
          ),

          new Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child:new Text("Deaths",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 24.0, fontStyle: FontStyle.italic, decoration: TextDecoration.underline),
            ),
          ),

          new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child:new Text(globalDeaths,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 24.0),
            ),
          )
        ],
      ),
    );
    return null;
  }

}
