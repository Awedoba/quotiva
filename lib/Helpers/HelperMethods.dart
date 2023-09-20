import 'package:quotiva/Helpers/RequestHelper.dart';
import 'package:quotiva/models/Quote.dart';

class HelperMethods {
  static Future<List<Quote>> getQoutes() async {
    // List<Quote> qoutes;
    var resQuotes;
    // var resQuotes;
    var responce =
        await RequestHelper.receiveRequest('https://favqs.com/api/quotes');
    if (responce != 'Error, no responce') {
      resQuotes = Quote.fromJson(responce["quotes"]);
      // print('read ' + resQuotes);
    }
    return resQuotes;
  }
  // static Future<Quote> saveQuote{

  // }
  // static Future<Quote> removeQuote{

  // }
}
