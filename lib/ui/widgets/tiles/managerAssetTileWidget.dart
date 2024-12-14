import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class ManagerAssetTile extends StatelessWidget {
  final String owner;
  final String title;
  final String dates;
  static const keyDarkMode = 'key-dark-mode';

  final String image;

  const ManagerAssetTile({
    Key? key,
    required this.owner,
    required this.title,
    required this.dates,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        height: 150,
        width: 400,
        child: Card(
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.all(7),
            child: Stack(children: <Widget>[
              Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                            'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=1200',
                            fit: BoxFit.contain,
                            width: 150,
                            height: 120,
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            owner,
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                            textAlign: TextAlign.left,
                          ),
                          Text(title),
                          Text(
                            dates,
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                        ],
                      )
                    ],
                  ))
            ]),
          ),
        ));
  }
}
