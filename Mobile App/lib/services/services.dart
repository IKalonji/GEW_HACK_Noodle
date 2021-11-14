import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:masi/commons/constant.dart';

class Services {
  Future<String> textractService(String userImage) async {
    final url =
        "https://hphkxtsi7e.execute-api.us-east-2.amazonaws.com/default/GEWhHackathon";

    final hearders = {
      "Content-Type": "application/json",
      "x-api-key": "40npImsUOO6MZhkJVahdQ4VY9bF2R1MU1anKF5VX"
    };

    Map data = {"Image": userImage};

    var response = await http.post(Uri.parse(url),
        headers: hearders, body: json.encode(data));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      return jsonResponse["Names:"];
    }
    return "empty";
  }

  void getCall() async {
    final url = "http://a356-154-117-131-230.ngrok.io/dasha";
    var response = await http.get(Uri.parse(url));
  }
}
