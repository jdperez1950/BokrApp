import '../../../../blocs/listing_car.bloc.dart';
import '../../../../components/custom_widget_page/stateless_custom.dart';
import '../../yacht/section/duration.section.dart';
import 'prepare_trip.section.dart';

class TripAcceptLongestTimeSection extends StatelessCustom {
  final ListingCarBloc bloc;

  TripAcceptLongestTimeSection({
    super.key,
    required this.bloc,
  });

  final List<ItemKeyValue<int>> hours = [
    ItemKeyValue(label: "5 days", value: 120),
    ItemKeyValue(label: "1 week", value: 168),
    ItemKeyValue(label: "2 weeks", value: 336),
    ItemKeyValue(label: "1 month", value: 720),
    ItemKeyValue(label: "3 months", value: 2160),
    ItemKeyValue(label: "Any", value: 0, recommend: true),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: bloc.acceptTripLongestTimeStream,
      initialData: -1,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.only(
            top: responsive.hp(3),
            left: responsive.wp(5),
            right: responsive.wp(5),
          ),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, index) {
                    final item = hours[index];
                    return Column(
                      children: [
                        ItemSelect(
                          item: item,
                          onClick: bloc.addAcceptTripLongestTime,
                          value: item.value,
                          active: item.value == snapshot.data,
                        ),
                        SizedBox(
                          height: responsive.hp(3),
                        ),
                      ],
                    );
                  },
                  childCount: hours.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
