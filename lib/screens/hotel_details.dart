import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/models/all_hotels.dart';

class HotelDetails extends StatefulWidget {
  final AllHotels hotels;

  HotelDetails({this.hotels});

  @override
  _HotelDetailsState createState() => _HotelDetailsState();
}

class _HotelDetailsState extends State<HotelDetails> {
  bool isPress = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color(0xff757575),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 320,

                // height: size.height * 0.4,
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
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
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
                        child: Image.asset(widget.hotels.imageUrl,
                            fit: BoxFit.cover),
                      ),
                      Image.asset(widget.hotels.imageUrl, fit: BoxFit.cover),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            widget.hotels.city,
                            style:
                                TextStyle(fontFamily: 'Futura', fontSize: 22),
                          ),
                        ),
                        Text(
                          "\$${widget.hotels.price.toString()}",
                          // textAlign: TextAlign.justify,
                          style: TextStyle(fontFamily: 'Futura', fontSize: 24),
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          widget.hotels.name,
                          style: TextStyle(fontFamily: 'Futura', fontSize: 30),
                        ),
                        SizedBox(width: 90),
                        IconButton(
                          iconSize: 30,
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
                        Text(
                          "18.4k",
                          style: TextStyle(
                              fontFamily: 'Futura',
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
