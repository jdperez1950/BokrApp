import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';

class AssetTile extends StatelessWidget {
  final String owner;
  final String title;
  final String startDate;
  final String endDate;
  final String status;
  final String imagePath;

  const AssetTile({
    Key? key,
    required this.owner,
    required this.title,
    required this.status,
    required this.imagePath,
    required this.startDate,
    required this.endDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        children: [
          SizedBox(
            width: (MediaQuery.of(context).size.width / 2) - 32,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                owner,
                style: TextStyle(
                  color: ThemeUtils.greyColor,
                  fontSize: 12,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                startDate,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.29),
                  fontSize: 10,
                ),
              ),
              Text(
                endDate,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.29),
                  fontSize: 10,
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF8B2FE0)),
                  minimumSize: const Size(80, 30),
                  maximumSize: const Size(120, 100),
                  shape: const StadiumBorder(),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
