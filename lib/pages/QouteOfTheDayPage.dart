import 'package:flutter/material.dart';
import 'package:quotiva/Helpers/HelperMethods.dart';
import 'package:quotiva/models/Quote.dart';
import 'package:quotiva/widget/QuoteCard.dart';

class QouteOfTheDayPage extends StatefulWidget {
  const QouteOfTheDayPage({super.key});

  @override
  State<QouteOfTheDayPage> createState() => _QouteOfTheDayPageState();
}

class _QouteOfTheDayPageState extends State<QouteOfTheDayPage> {
  Future<Quote>? quote;
  void initState() {
    super.initState();
    quote = HelperMethods.getQoute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Qoute Of The Day'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: FutureBuilder(
          future: quote,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return QuoteCard(
                  snapshot.data!.author!, snapshot.data!.body!, true);
            }
            return Container();
          }),
    );
  }
}
