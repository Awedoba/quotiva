// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quotiva/Helpers/HelperMethods.dart';
import 'package:quotiva/models/Quote.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Quote>>? quote;
  @override
  void initState() {
    super.initState();
    quote = HelperMethods.getQoutes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Quotiva'),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      ),
      body: FutureBuilder(
          future: quote,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
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
                                snapshot.data![index].author!,
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                snapshot.data![index].body!,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon:
                                          Icon(Icons.favorite_border_outlined)),
                                  IconButton(
                                      onPressed: () {
                                        Share.share(
                                            snapshot.data![index].body!);
                                      },
                                      icon: Icon(Icons.share))
                                ],
                              ),
                            ],
                          )),
                    );
                  });
            }
            return Container();
          }),
    );
  }
}
