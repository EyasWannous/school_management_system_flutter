import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../applink.dart';

class Crud {
  Future postData(String linkUrl, data, String headers) async {
    log(data);

    var response = await http.post(Uri.parse(linkUrl),
        body: data, headers: {'Authorization': "Bearer ${AppLink.Token}"});
    if (response.statusCode == 200 || response.statusCode == 201) {
      log('before response body //////////////////////////////////////////');

      var responseBody = jsonDecode(response.body);

      return responseBody;
    } else {
      log('before else //////////////////////////////////////////${response.statusCode}');
    }
  }

  // ignore: non_constant_identifier_names
  Future GetData(String linkUrl, String headers) async {
    log('before curd  get//////////////////////////////////////////');
    var response = await http.get(
      Uri.parse(linkUrl),
      headers: {
        'Authorization': "Bearer 10|alJAtRrzs8ciGMCP9qmnGPx6jdovcwQLQRzZ6rJk"
      },
    );
    log("after curd get //////////////////////////////////");
    if (response.statusCode == 200 || response.statusCode == 201) {
      log('before response get//////////////////////////////////////////////////////');
      var responseBody = await jsonDecode(response.body);
      return responseBody;
    } else {
      log("Request failed with status: ${response.statusCode}.");
    }
  }
}
