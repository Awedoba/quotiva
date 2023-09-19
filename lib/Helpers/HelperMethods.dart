import 'package:quotiva/Helpers/RequestHelper.dart';
import 'package:quotiva/models/Quote.dart';

class HelperMethods {
  static void getQoutes() async {
    List<Quote> qoutes;
    var responce =
        await RequestHelper.receiveRequest('https://favqs.com/api/quotes');
    if (responce != 'Error, no responce') {
      var resQuotes = responce["quotes"];
      // print('read ' + resQuotes);
    }
  }
  // static Future<Quote> saveQuote{

  // }
  // static Future<Quote> removeQuote{

  // }
}
