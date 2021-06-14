import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import 'package:travel_app/models/destination_item.dart';

class DestinationCard extends StatefulWidget {
  final Destination2 destination;
  final Function press;

  DestinationCard({this.destination, this.press});

  @override
  _DestinationCardState createState() => _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard>
    with SingleTickerProviderStateMixin {
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
    return GestureDetector(
      onTap: widget.press,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 15,
            child: Container(
              height: 230,
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
                      widget.destination.country,
                      style: TextStyle(
                        // color: Colors.white,
                        fontFamily: 'Futura',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.destination.city,
                          style: TextStyle(
                              fontFamily: 'Futura',
                              // color: Colors.white,
                              fontSize: 22.0,
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
                    child: Hero(
                      tag: "move",
                      child: Image.asset(
                          widget.destination.imageUrl,
                          height: 200,
                          width: 200,
                          scale: 1,
                          fit: BoxFit.cover,
                        ),
                    ),
                    

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
  }
}
