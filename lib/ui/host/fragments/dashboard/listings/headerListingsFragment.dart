import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import '../../../../widgets/icon_widget.dart';

class HeaderListingsFragment extends StatelessWidget {
  static const name = "Raymond Mauge";
  static const phone = "+1 905 98 89 89 89";

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const SizedBox(height: 32),
          Container(
            width: 350,
            height: 150,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.network(
                  'https://i.pinimg.com/originals/c7/58/43/c7584365f991ea6236fd1f19653f06a2.jpg',
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(height: 5),
          buildListing(context),
        ],
      );

  Widget buildHeader() => Center(
        child: Text(
          'Your Listing',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.1,
          ),
        ),
      );

  Widget buildListing(BuildContext context) => InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Luxury Villa",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Text("5.0", style: TextStyle(fontSize: 12)),
                      Icon(
                        Icons.star,
                        size: 11,
                        color: Colors.orange,
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                "Miami Beach, Florida",
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),
        ),
      );
}
