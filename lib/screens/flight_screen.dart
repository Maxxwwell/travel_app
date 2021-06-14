import 'package:flutter/material.dart';
import 'package:travel_app/components/destination_card.dart';
import 'package:travel_app/models/destination.dart';
import 'package:travel_app/models/destination_item.dart';
import 'package:flutter/animation.dart';

import 'details.dart';

class Flight extends StatefulWidget {
  @override
  _FlightState createState() => _FlightState();
}

class _FlightState extends State<Flight> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    _controller.forward();
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      children: [
        Text(
          'Where would you like to travel?',
          style: TextStyle(
              fontFamily: 'Futura', fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Top Destinations',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Futura',
                  fontSize: 21.0,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.arrow_right_sharp,
              size: 28,
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
        Container(
          height: 300,
          // color: Colors.blue,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: top_destinations.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  width: 210,
                  height: 150,
                  // color: Colors.red,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        bottom: 15,
                        child: Container(
                          height: 170,
                          width: 210,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  top_destinations[index].country,
                                  style: TextStyle(
                                    // color: Colors.white,
                                    fontFamily: 'Futura',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      top_destinations[index].city,
                                      style: TextStyle(
                                          fontFamily: 'Futura',
                                          // color: Colors.white,
                                          fontSize: 23.0,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    RotationTransition(
                                      turns: _animation,
                                      alignment: Alignment(0.1, 0.1),
                                      child: Icon(
                                        Icons.explore,
                                        size: 30,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[700],
                                  offset: Offset(0.8, 2.0),
                                  blurRadius: 6.0),
                            ]),
                        child: Stack(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                    top_destinations[index].imageUrl,
                                    height: 180,
                                    width: 220,
                                    scale: 1,
                                    fit: BoxFit.cover)

                                //   Image.asset(
                                //       top_destinations[index].imageUrl2,
                                //       fit: BoxFit.cover)
                                // ],
                                // )
                                ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Destinations',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Futura',
                  fontSize: 21.0,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.arrow_drop_down,
              size: 28,
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
        Container(
          height: 300,
          color: Colors.transparent,
          child: GridView.builder(
              itemCount: destination2.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.74,
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 1,
              ),
              itemBuilder: (context, int index) => DestinationCard(
                    destination: destination2[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetaiisScreen(
                          destination: destination2[index],
                        ),
                      ),
                    ),
                  )),
        )
      ],
    );
  }
}
