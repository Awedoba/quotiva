import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quotiva/Helpers/HelperMethods.dart';
import 'package:quotiva/widget/QuoteCard.dart';
import 'package:share_plus/share_plus.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  final _favoriteBox = Hive.box('favorite_box');
  List<Map<String, dynamic>> _favs = [];
  void _refreshFavs() {
    final data = _favoriteBox.keys.map((key) {
      final item = _favoriteBox.get(key);

      return {'id': key, "author": item["author"], "body": item["body"]};
    }).toList();

    setState(() {
      _favs = data.reversed.toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshFavs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Quotiva'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: ListView.builder(
          itemCount: _favs.length,
          itemBuilder: (context, index) {
            final currentFav = _favs[index];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 234, 242, 255),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentFav['author'],
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        currentFav['body'],
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () async {
                                HelperMethods.removeToFavorite(index);
                                _refreshFavs();
                              },
                              icon: Icon(Icons.delete)),
                          IconButton(
                              onPressed: () {
                                Share.share(
                                    "${currentFav['author']}\n--${currentFav['body']}");
                              },
                              icon: Icon(Icons.share))
                        ],
                      ),
                    ],
                  )),
            );
            // QuoteCard(
            //     currentFav[index].author!, currentFav[index].body!, false);
          }),
    );
  }
}
