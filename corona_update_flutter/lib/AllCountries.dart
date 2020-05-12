import 'dart:convert';

import 'package:coronaupdateflutter/CasesInfo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class AllCountries extends StatefulWidget {
  @override
  AllCountriesCases createState() => AllCountriesCases();
}

class AllCountriesCases extends State<AllCountries> {
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
  List<CasesInfo> list;
  List rest;

  @override
  void initState() {
    //  getAllCountriesCoronaUpdate();
    //   getData();
  }

  Future<List<CasesInfo>> getData() async {
    String link = "https://coronavirus-19-api.herokuapp.com/countries";
    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    print(res.body);
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      rest = data as List;
      print(rest);
      list = rest.map<CasesInfo>((json) => CasesInfo.fromJson(json)).toList();
      list = list;
    }
    print("List Size: ${list.length}");
    return list;
  }

  getAllCountriesCoronaUpdate() async {
    String baseUrl = "https://coronavirus-19-api.herokuapp.com/countries";

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

  Widget listViewWidget(List<CasesInfo> info) {
    return Container(
      child: ListView.builder(
          itemCount: info.length,
          padding: const EdgeInsets.all(2.0),
          itemBuilder: (context, position) {
            country = '${info[position].country}';
            cases = '${info[position].cases}'.toString();
            todayCases = '${info[position].todayCases}'.toString();
            deaths = '${info[position].deaths}'.toString();
            todayDeaths = '${info[position].todayDeaths}'.toString();
            recovered = '${info[position].recovered}'.toString();
            active = '${info[position].active}'.toString();
            critical = '${info[position].critical}'.toString();
            casesPerMillion = '${info[position].casesPerMillion}'.toString();
            deathsPerMillion = '${info[position].deathsPerMillion}'.toString();
            totalTests = '${info[position].totalTests}'.toString();
            testsPerMillion = '${info[position].testsPerMillion}'.toString();
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(
                  color: Colors.blueGrey,
                  width: 1.0,

                ),
              ),

              child: ListTile(
                title: Column(
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: new Text(
                        country,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black38,
                            fontSize: 16.0,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    new Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                                    color: Colors.black45,
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
                                    color: Colors.black45,
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
                                    color: Colors.black45,
                                    fontSize: 12.0),
                              ),
                            ),
                          ],
                        )),
                    new Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                                    color: Colors.black45,
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
                                    color: Colors.black45,
                                    fontSize: 12.0),
                              ),
                            ),
                          ],
                        )),
                    new Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                                    color: Colors.black45,
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
                                    color: Colors.black45,
                                    fontSize: 12.0),
                              ),
                            ),
                          ],
                        )),
                    new Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Row(
                          children: <Widget>[
                            new Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: new Text(
                                "Cases per million: " +
                                    casesPerMillion +
                                    "  |  ",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
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
                                    color: Colors.black45,
                                    fontSize: 12.0),
                              ),
                            ),
                          ],
                        )),
                    new Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Row(
                          children: <Widget>[
                            new Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: new Text(
                                "Total tests: " + totalTests + "  |  ",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                    fontSize: 12.0),
                              ),
                            ),
                            new Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: new Text(
                                "Tests per million: " + testsPerMillion,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                    fontSize: 12.0),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
                //   onTap: () => _onTapItem(context, article[position]),
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List>(
        future: getData(),
        // initialData: List(),
        builder: (context, snapshot) {
          /* return snapshot.hasData
              ? ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (_, int position) {
              final item = snapshot.data[position];

              //get your item data here ...
              return Card(
                child: ListTile(
                  title: Text(
                      "Employee Name: " + snapshot.data[position].row[1]),
                ),
              );
            },
          )*/
          return snapshot.data != null
              ? listViewWidget(snapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

/*
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, position) {
          return Column(
            children: <Widget>[

              new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child:new Text(rest.toString(),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 24.0),
                ),
              ),

              new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child:new Text("Cases: " + cases + " | ",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 24.0),
                      ),
                    ),

                    new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child:new Text("Today: " + todayCases + " | ",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 24.0),
                      ),
                    ),

                    new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child:new Text("Active: " + active ,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 24.0),
                      ),
                    ),

                  ],
                )
              ),

              new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    children: <Widget>[
                      new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child:new Text("Deaths: " + deaths + " | ",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 24.0),
                        ),
                      ),

                      new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child:new Text("Today: " + todayDeaths ,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 24.0),
                        ),
                      ),

                    ],
                  )
              ),

              new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    children: <Widget>[
                      new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child:new Text("Recovered: " + recovered + " | ",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 24.0),
                        ),
                      ),

                      new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child:new Text("Critical: " + critical ,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 24.0),
                        ),
                      ),

                    ],
                  )
              ),

              new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    children: <Widget>[
                      new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child:new Text("Cases per million: " + casesPerMillion + " | ",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 24.0),
                        ),
                      ),

                      new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child:new Text("Deaths per million: " + deathsPerMillion ,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 24.0),
                        ),
                      ),

                    ],
                  )
              ),

              new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    children: <Widget>[
                      new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child:new Text("Total tests: " + totalTests + " | ",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 24.0),
                        ),
                      ),

                      new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child:new Text("Tests per million: " + testsPerMillion ,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 24.0),
                        ),
                      ),

                    ],
                  )
              ),

              Divider(
                height: 2.0,
                color: Colors.grey,
              )
            ],
          );
        },
        itemCount: rest.length,
      ),
    );
    return null;
  }
*/

}
