import 'package:http/http.dart';

class CasesInfo {
  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  int casesPerMillion;
  int deathsPerMillion;
  int totalTests;
  int testsPerMillion;


  CasesInfo(
      {this.country,
        this.cases,
        this.todayCases,
        this.deaths,
        this.todayDeaths,
        this.recovered,
        this.active,
        this.critical,
        this.casesPerMillion,
        this.deathsPerMillion,
        this.totalTests,
        this.testsPerMillion});

  factory CasesInfo.fromJson(Map<String, dynamic> json) {
    return CasesInfo(
        country: json["country"],
        cases: json["cases"],
        todayCases: json["todayCases"],
        deaths: json["deaths"],
        todayDeaths: json["todayDeaths"],
        recovered: json["recovered"],
        active: json["active"],
        critical: json["critical"],
        casesPerMillion: json["casesPerOneMillion"],
        deathsPerMillion: json["deathsPerOneMillion"],
        totalTests: json["totalTests"],
        testsPerMillion: json["testsPerOneMillion"]);
  }
}

class Source {
  Source country;
  String cases;
  String todayCases;
  String deaths;
  String todayDeaths;
  String recovered;
  String active;
  String critical;
  String casesPerMillion;
  String deathsPerMillion;
  String totalTests;
  String testsPerMillion;

  Source({this.country, this.cases, this.todayCases, this.deaths, this.todayDeaths, this.recovered, this.active, this.critical, this.casesPerMillion,
    this.deathsPerMillion, this.totalTests, this.testsPerMillion});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
    /*  id: json["id"] as String,
      name: json["name"] as String,*/
    );
  }
}
