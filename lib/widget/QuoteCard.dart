import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quotiva/Helpers/HelperMethods.dart';
import 'package:share_plus/share_plus.dart';

class QuoteCard extends StatefulWidget {
  final String author;
  final String body;
  final bool isQuoteOfTheDay;
  const QuoteCard(
    this.author,
    this.body,
    this.isQuoteOfTheDay, {
    super.key,
  });

  @override
  State<QuoteCard> createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 234, 242, 255),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize:
                widget.isQuoteOfTheDay ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: widget.isQuoteOfTheDay
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.author,
                textAlign:
                    widget.isQuoteOfTheDay ? TextAlign.center : TextAlign.left,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.body,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () async {
                        HelperMethods.addToFavorite(widget.author, widget.body);
                        Fluttertoast.showToast(
                          msg: 'QUote removed to favorite',
                        );
                      },
                      icon: Icon(Icons.favorite_border_outlined)),
                  IconButton(
                      onPressed: () {
                        Share.share("${widget.body}\n--${widget.author}");
                      },
                      icon: Icon(Icons.share))
                ],
              ),
            ],
          )),
    );
  }
}
