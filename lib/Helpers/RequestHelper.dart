import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quotiva/globals.dart';

class RequestHelper {
  static Future<dynamic> receiveRequest(String url) async {
    http.Response httpResponce = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Token token="$apiKey"'});
    try {
      if (httpResponce.statusCode != 200) {
        return 'Error, no responce';
      }
      String responseData = httpResponce.body;
      var decodeResponce = jsonDecode(responseData);
      return decodeResponce;
    } catch (exp) {
      // throw Exception('Failed to load Qoute');
      return 'Error, no responce';
    }
  }
}
