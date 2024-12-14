import 'package:flutter/material.dart';

class ListingTile extends StatelessWidget {
  final String title;
  final String location;
  final String price;
  final bool discount;
  final String discPrice;
  final String timeUnit;
  final String rating;
  final String image;
  final double height;
  final double width;

  const ListingTile({
    Key? key,
    required this.title,
    required this.location,
    required this.price,
    required this.discount,
    required this.discPrice,
    required this.timeUnit,
    required this.rating,
    required this.image,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        child: Card(
          elevation: 2,
          child: Stack(children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  width: width,
                  height: height * 0.6,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        Text(location, style: TextStyle(fontSize: 10)),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(rating,
                                          style: TextStyle(fontSize: 11)),
                                      Icon(
                                        Icons.star,
                                        size: 11,
                                        color: Colors.orange,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  )
                                ],
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Text('\$$price',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold)),
                                        Text('/$timeUnit',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    )
                                  ]),
                            ])
                      ]),
                ),
              ]),
            )
          ]),
        ));
  }
}
