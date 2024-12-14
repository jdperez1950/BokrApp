import 'package:brokr/ui/widgets/gradient_button.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../utils/form_utils.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String address;
  final double rating;
  final String image;
  final double price;
  final double price2;
  final bool isFavourite;
  final double heightImage;
  final BorderRadius borderRadius = const BorderRadius.all(Radius.circular(10));
  final EdgeInsetsGeometry? margin;
  final bool isSmall;

  const ItemCard({
    super.key,
    required this.title,
    required this.address,
    required this.rating,
    required this.image,
    required this.price,
    required this.price2,
    required this.isFavourite,
    this.margin,
    this.heightImage = 175,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        child: Column(
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
                          borderRadius: BorderRadius.only(
                            topLeft: borderRadius.topLeft,
                            topRight: borderRadius.topRight,
                          ),
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
                GestureDetector(
                  onTap: () {
                    if (!isFavourite) {
                      showMaterialModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                        ),
                        context: context,
                        builder: (context) => Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          padding: const EdgeInsets.all(32),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 75,
                                  height: 6,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFD9D9D9),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.favorite,
                                color: Colors.amber,
                                size: 120,
                              ),
                              const SizedBox(height: 24),
                              const Text(
                                'The selected listing has been added\nto your favorites',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: isFavourite
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.amber,
                            )
                          : const Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.white,
                            ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16, vertical: isSmall ? 16 : 24),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(fontSize: isSmall ? 14 : 16),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              address,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                    fontSize: isSmall ? 10 : 12,
                                    color: ThemeUtils.greyColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset('assets/images/circle_orange.png',
                              height: isSmall ? 35 : 45,
                              width: isSmall ? 35 : 45),
                          Text(
                            'DEAL',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color: Colors.white,
                                    fontSize: isSmall ? 12 : 14),
                          ),
                        ],
                      )
                    ],
                  ),
                  if (!isSmall) const SizedBox(height: 8),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          '$rating',
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    fontSize: 14,
                                    color: ThemeUtils.greyColor,
                                  ),
                        ),
                      ),
                      const Icon(
                        Icons.star,
                        color: Color(0xFFFFB134),
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      SvgPicture.asset(
                        'assets/icons/super_host_icon.svg',
                        height: 12,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Superhost',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.29),
                            ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '\$${FormUtils.formatDoubleNumber(price)}/night',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(fontSize: 14),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'was on BKR \$${FormUtils.formatDoubleNumber(price2)}/night',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(fontSize: 9),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
