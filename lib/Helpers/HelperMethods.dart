import 'package:quotiva/Helpers/RequestHelper.dart';
import 'package:quotiva/models/Quote.dart';

class HelperMethods {
  static Future<List<Quote>>? getQoutes() async {
    // List<Quote> qoutes;
    // Future<List<Quote>>? resQuotes;
    // var resQuotes;
    Map responce =
        await RequestHelper.receiveRequest('https://favqs.com/api/quotes');
    if (responce != 'Error, no responce') {
      return responce["quotes"]
          .map<Quote>((qoute) => Quote.fromJson(qoute))
          .toList() as List<Quote>;
    }
    return [];
  }

  static Future<Quote>? getQoute() async {
    // List<Quote> qoutes;
    // Future<List<Quote>>? resQuotes;
    // var resQuotes;
    Map responce =
        await RequestHelper.receiveRequest('https://favqs.com/api/qotd');
    if (responce != 'Error, no responce') {
      return Quote.fromJson(responce["quote"]);
    }
    return Quote();
  }
  // static Future<Quote> saveQuote{

  // }
  // static Future<Quote> removeQuote{

  // }
}
