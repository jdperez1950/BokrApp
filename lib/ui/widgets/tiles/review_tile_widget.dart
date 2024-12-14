import 'package:brokr/ui/widgets/stars_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

class ReviewTileWidget extends StatelessWidget {
  final String name;
  final String text;
  final String image;
  final String date;
  final String id;
  final double rating;
  final double imageSide = 35.0;

  const ReviewTileWidget(
      {super.key,
      required this.name,
      required this.text,
      required this.image,
      required this.date,
      required this.id,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        height: 100,
        width: 100,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          elevation: 0.5,
          shadowColor: Colors.grey,
          child: Padding(
            padding: EdgeInsets.all(7),
            child: Stack(children: <Widget>[
              Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: image,
                            imageBuilder: (context, imageProvider) => Stack(
                              children: [
                                Container(
                                  width: imageSide,
                                  height: imageSide,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ],
                            ),
                            placeholder: (context, url) => CardLoading(
                              width: imageSide,
                              height: imageSide,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              Text(
                                name,
                                style: TextStyle(fontSize: 12),
                              ),
                              StarsWidget(rating: rating, size: 12)
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: 80,
                          child: Text(
                            text,
                            style: TextStyle(fontWeight: FontWeight.w100),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          date,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      )
                    ],
                  ))
            ]),
          ),
        ));
  }
}
