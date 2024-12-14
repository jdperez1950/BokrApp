import 'package:brokr/models/crew_member_model.dart';
import 'package:brokr/ui/widgets/gradient_button.dart';
import 'package:brokr/ui/widgets/stars_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

class CrewTileWidget extends StatelessWidget {
  final CrewMember crew;

  final double imageSide = 50.0;

  const CrewTileWidget({
    super.key,
    required this.crew,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          elevation: 0,
          shadowColor: Colors.grey,
          child: Container(
            child: Stack(children: <Widget>[
              Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: crew.image,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    crew.name,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  StarsWidget(rating: crew.rating, size: 12)
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text('${crew.trips} Trips',
                                      style: TextStyle(fontSize: 12)),
                                  SizedBox(
                                    height: 12,
                                    child: VerticalDivider(
                                      width: 5,
                                      thickness: 1,
                                      color: Colors.black,
                                      endIndent: 0,
                                    ),
                                  ),
                                  Text('Joined ${crew.date}',
                                      style: TextStyle(fontSize: 12))
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ))
            ]),
          ),
        ));
  }
}
