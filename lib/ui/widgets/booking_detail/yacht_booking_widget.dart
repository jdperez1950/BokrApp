import 'package:brokr/models/crew_member_model.dart';
import 'package:brokr/models/policy_model.dart';
import 'package:brokr/ui/widgets/allowed_widget.dart';
import 'package:brokr/ui/widgets/location_widget.dart';
import 'package:brokr/ui/widgets/tiles/amenities_tile_widget.dart';
import 'package:brokr/ui/widgets/tiles/cancelation_policy_tile_widget.dart';
import 'package:brokr/ui/widgets/tiles/characteristics_widget.dart';
import 'package:brokr/ui/widgets/gradient_button.dart';
import 'package:brokr/ui/widgets/tiles/crew_tile_widget.dart';
import 'package:brokr/ui/widgets/tiles/review_tile_widget.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/form_utils.dart';
import '../item_card.dart';

class YachtBookingWidget extends StatelessWidget {
  final String title;
  final String owner;
  final String address;
  final String description;
  final String startDate;
  final String endDate;
  final double bed;
  final double bath;
  final int guests;
  final double rating;
  final String image;
  final double price;
  final double price2;
  final bool isFavourite;
  final PolicyModel policy;
  final double heightImage = 175;
  final BorderRadius borderRadius = const BorderRadius.all(Radius.circular(10));
  final EdgeInsetsGeometry? margin;
  final List<CharactersticsWidget> characteristics;
  final VoidCallback messageHost;

  final CrewMember crew;
  final List<AmenitiesTieWidget> amenities;

  final List<ReviewTileWidget> reviews;

  final List<String> allowed;
  final List<String> notAllowed;

  final VoidCallback onPressContinue;

  const YachtBookingWidget({
    super.key,
    required this.title,
    required this.owner,
    required this.address,
    required this.rating,
    required this.image,
    required this.price,
    required this.price2,
    required this.isFavourite,
    this.margin,
    required this.bed,
    required this.bath,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.guests,
    required this.policy,
    required this.crew,
    required this.characteristics,
    required this.amenities,
    required this.reviews,
    required this.allowed,
    required this.notAllowed,
    required this.onPressContinue,
    required this.messageHost,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CachedNetworkImage(
              imageUrl: image,
              imageBuilder: (context, imageProvider) => Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: heightImage,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.only(bottomLeft: Radius.zero),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
              placeholder: (context, url) => CardLoading(
                width: MediaQuery.of(context).size.width,
                height: heightImage,
                borderRadius: borderRadius,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Icon(
                  Icons.favorite,
                  color: isFavourite ? Colors.amber : ThemeUtils.greyColor,
                ),
              ),
            )
          ],
        ),
        Padding(
            padding: margin!,
            child: Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${owner}\'s',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.favorite,
                          size: 14,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Superhost',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(rating.toString(),
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                        Icon(
                          Icons.star,
                          size: 14,
                          color: Colors.orange,
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          address,
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${bed} bed/${bath} bath',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        )
                      ],
                    ),
                    Text('${bath} Reviews')
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month_outlined,
                              size: 22,
                              color: Colors.purple,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              children: [
                                Text(
                                  startDate,
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  endDate,
                                  style: TextStyle(fontSize: 14),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                          child: const VerticalDivider(
                            thickness: 0.5,
                            width: 20,
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.group_outlined,
                              size: 22,
                              color: Colors.purple,
                            ),
                            Text(
                              '${guests} Guests',
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.edit_outlined,
                              size: 22,
                            ),
                            SizedBox(
                              height: 25,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Characteristics',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: characteristics.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3.5,
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 5),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {},
                        child: Container(child: characteristics[index]));
                  },
                ),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(description),
                ),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Features',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: amenities.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1,
                      crossAxisCount: 4,
                      mainAxisSpacing: 0),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {},
                        child: Container(child: amenities[index]));
                  },
                ),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Location',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                LocationWidget(
                  sideSize: 400,
                ),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Reviews',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: reviews.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1,
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 5),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {}, child: Container(child: reviews[index]));
                  },
                ),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'About your Crew',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                CrewTileWidget(
                  crew: crew,
                ),
                Container(
                  width: 240,
                  child: GradientButton(
                    weight: FontWeight.normal,
                    text: 'Message the Host',
                    onTap: () {
                      messageHost;
                    },
                    cornersRadius: 10,
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Things to know',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                AllowedWidget(allowed: allowed, notAllowed: notAllowed),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Cancelation Policy',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                CancelationPolicyTileWidget(policy: policy),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Similar Yachts',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                ItemCard(
                  title: 'Luxury Villa 5bed/6bath waterfront',
                  address: 'Miami Beach Florida, United States',
                  rating: 4.5,
                  image: 'https://picsum.photos/500',
                  price: 7490,
                  price2: 7899,
                  isFavourite: true,
                  margin: EdgeInsets.only(bottom: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Report Listing',
                      style: TextStyle(
                          fontSize: 12, decoration: TextDecoration.underline),
                    )
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '\$${FormUtils.formatDoubleNumber(price)}',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  fontSize: 10,
                                  decoration: TextDecoration.lineThrough),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '\$${FormUtils.formatDoubleNumber(price2)}',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      width: 140,
                      child: GradientButton(
                        weight: FontWeight.normal,
                        text: 'Continue',
                        onTap: () {
                          onPressContinue;
                        },
                        cornersRadius: 10,
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ],
    );
  }
}
