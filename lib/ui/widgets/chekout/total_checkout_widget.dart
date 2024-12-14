import 'package:brokr/models/bill_detail_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalCheckoutWidget extends StatelessWidget {
  final String timeUnit;
  final double timeUnitAmount;
  final double timeUnitPrice;
  final double total;
  final List<BillDetailItem> detailItems;

  const TotalCheckoutWidget(
      {super.key,
      required this.timeUnit,
      required this.timeUnitPrice,
      required this.detailItems,
      required this.timeUnitAmount,
      required this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'priceDet'.tr,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 2),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${timeUnit} ${timeUnitAmount}${timeUnit[0]}'),
                  Text('\$${timeUnitAmount * timeUnitPrice}')
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                itemCount: detailItems.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          detailItems.elementAt(index).isPercentage
                              ? Text(
                                  '${detailItems.elementAt(index).name} ${detailItems.elementAt(index).value}%')
                              : Text(detailItems.elementAt(index).name),
                          detailItems.elementAt(index).isPercentage
                              ? Text(
                                  '\$${(timeUnitPrice * timeUnitAmount) * detailItems.elementAt(index).value}')
                              : Text('\$${detailItems.elementAt(index).value}')
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${'tot'.tr} (USD)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('${'\$'.tr}${total}',
                      style: TextStyle(fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
