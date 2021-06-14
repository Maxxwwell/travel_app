import 'package:flutter/material.dart';
import 'package:travel_app/components/hotel_card.dart';
import 'package:travel_app/models/all_hotels.dart';
import 'package:travel_app/models/hotel.dart';
import 'package:travel_app/screens/hotel_details.dart';

class Hotel extends StatelessWidget {
  final AllHotels hotels;
  Hotel({this.hotels});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      children: [
        Text(
          'Where would you like to relax?',
          style: TextStyle(
              fontFamily: 'Futura', fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Top Hotels',
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
              itemCount: top_hotels.length,
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
                                  top_hotels[index].country,
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
                                      top_hotels[index].city,
                                      style: TextStyle(
                                          fontFamily: 'Futura',
                                          // color: Colors.white,
                                          fontSize: 23.0,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "\$${top_hotels[index].price.toString()}",
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
                                child: Image.asset(top_hotels[index].imageUrl,
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
              'Hotels',
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
              itemCount: all_hotels.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.74,
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 1,
              ),
              itemBuilder: (context, int index) => HotelItem(
                    hotels: all_hotels[index],
                    press: () => showModalBottomSheet(
                      context: context,
                      builder: (context) => HotelDetails(
                        hotels: all_hotels[index],
                      ),
                    ),
                  )),
        )
      ],
    );
  }
}
