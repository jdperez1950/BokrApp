import 'package:flutter/material.dart';

class AllowedWidget extends StatelessWidget {
  final List<String> allowed;
  final List<String> notAllowed;

  const AllowedWidget(
      {super.key, required this.allowed, required this.notAllowed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Allowed'),
            Text('Not Allowed'),
            SizedBox(
              width: 50,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: allowed.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Row(children: [
                      Icon(Icons.check_circle_outline),
                      Text(allowed[index])
                    ]),
                  );
                },
              ),
            ),
            Container(
                width: 100,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: notAllowed.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Row(children: [
                        Icon(Icons.cancel_outlined),
                        Text(notAllowed[index])
                      ]),
                    );
                  },
                )),
            SizedBox(
              width: 80,
            )
          ],
        ),
      ],
    );
  }
}
