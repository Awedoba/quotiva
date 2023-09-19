// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quotiva/Helpers/HelperMethods.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HelperMethods.getQoutes();
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
      body: Padding(
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
                  'Author',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                    'Supporting line text lorem ipsum dolor sit amet, consectetur.'),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border_outlined)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.share))
                  ],
                ),
              ],
            )
            // ListTile(
            //   title: Text('Author'),
            //   subtitle: Text(
            //       'Supporting line text lorem ipsum dolor sit amet, consectetur.'),
            //   trailing: Row(
            //     children: [
            //       IconButton(onPressed: () {}, icon: Icon(Icons.share)),
            //       IconButton(onPressed: () {}, icon: Icon(Icons.share))
            //     ],
            //   ),
            // ),
            ),
      ),
    );
  }
}
