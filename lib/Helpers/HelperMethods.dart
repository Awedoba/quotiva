import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:quotiva/Helpers/RequestHelper.dart';
import 'package:quotiva/models/Quote.dart';

class HelperMethods {
  static Future<List<Quote>>? getQoutes() async {
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
    Map responce =
        await RequestHelper.receiveRequest('https://favqs.com/api/qotd');
    if (responce != 'Error, no responce') {
      return Quote.fromJson(responce["quote"]);
    }
    return Quote();
  }

  static void addToFavorite(String author, String body) async {
    final _favoriteBox = Hive.box('favorite_box');

    await _favoriteBox.add({'author': author, 'body': body});
  }

  static void removeToFavorite(int index) async {
    final _favoriteBox = Hive.box('favorite_box');

    await _favoriteBox.delete(index);
  }
}
