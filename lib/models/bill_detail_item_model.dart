class BillDetailItem {
  final String name;
  final int order;
  final double value;
  final bool isPercentage;
  final bool positive;

  BillDetailItem(
      {required this.name,
      required this.order,
      required this.value,
      required this.isPercentage,
      required this.positive});
}
