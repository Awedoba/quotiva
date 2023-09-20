// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quotiva/Helpers/HelperMethods.dart';
import 'package:quotiva/Helpers/RequestHelper.dart';
import 'package:quotiva/models/Quote.dart';
import 'package:quotiva/pages/DrawerPage.dart';
import 'package:quotiva/widget/QuoteCard.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  Future<List<Quote>>? quotes;
  @override
  void initState() {
    super.initState();
    quotes = HelperMethods.getQoutes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      drawer: DrawerPage(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Quotiva'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              _scaffoldState.currentState!.openDrawer();
            },
            icon: Icon(Icons.menu)),
      ),
      body: FutureBuilder(
          future: quotes,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return QuoteCard(snapshot.data![index].author ?? '',
                        snapshot.data![index].body!, false);
                  });
            }
            return Container();
          }),
    );
  }
}
