import 'package:flutter/material.dart';
import 'package:travel_app/models/all_hotels.dart';
import 'package:travel_app/models/hotel.dart';

class HotelItem extends StatelessWidget {
  final AllHotels hotels;
  final Function press;

  HotelItem({this.hotels, this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
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
                      hotels.name,
                      style: TextStyle(
                        // color: Colors.white,
                        fontFamily: 'Futura',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          hotels.city,
                          style: TextStyle(
                              fontFamily: 'Futura',
                              // color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "\$${hotels.price.toString()}",
                          style: TextStyle(
                              fontFamily: 'Futura',
                              // color: Colors.white,
                              fontSize: 23.0,
                              fontWeight: FontWeight.w400),
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
                      hotels.imageUrl,
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
