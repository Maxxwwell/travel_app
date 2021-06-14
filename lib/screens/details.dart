import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/models/destination.dart';
import 'package:travel_app/models/destination_item.dart';

class DetaiisScreen extends StatefulWidget {
  final Destination2 destination;

  DetaiisScreen({this.destination});

  @override
  _DetaiisScreenState createState() => _DetaiisScreenState();
}

class _DetaiisScreenState extends State<DetaiisScreen> {
  bool isPress = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[700],
                          offset: Offset(0.8, 2.0),
                          blurRadius: 6.0),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    child: Carousel(
                      autoplay: true,
                      animationDuration: const Duration(seconds: 1),
                      autoplayDuration: const Duration(seconds: 8),
                      dotSize: 4,
                      dotSpacing: 15,
                      dotColor: Theme.of(context).primaryColor,
                      dotBgColor: Colors.transparent,
                      dotVerticalPadding: 5,
                      images: [
                        Hero(
                          tag: "move",
                          child: Image.asset(widget.destination.imageUrl,
                              fit: BoxFit.cover),
                        ),
                        Image.asset(widget.destination.image2Url,
                            fit: BoxFit.cover),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4.0, vertical: 20),
                  child: IconButton(
                      icon: Icon(
                        Icons.chevron_left,
                        size: 35,
                        color: Colors.white,
                      ),
                      onPressed: Navigator.of(context).pop),
                ),
                /////////////////////////////////////////////////
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 340),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              widget.destination.country,
                              style:
                                  TextStyle(fontFamily: 'Futura', fontSize: 22),
                            ),
                          ),
                          Icon(Icons.explore,
                              size: 30, color: Theme.of(context).primaryColor)
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(widget.destination.city,
                          style: TextStyle(fontFamily: 'Futura', fontSize: 28)),
                      Divider(),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isPress = !isPress;
                              });
                            },
                            icon: Icon(
                              isPress == false
                                  ? Icons.favorite_border
                                  : Icons.favorite,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text("20.2k"),
                          SizedBox(
                            width: 16.0,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.comment,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text("2.2k"),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        widget.destination.description,
                        // textAlign: TextAlign.justify,
                        style: TextStyle(fontFamily: 'Futura', fontSize: 19),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
