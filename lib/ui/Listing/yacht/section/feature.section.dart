import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../blocs/listing_yacht.bloc.dart';
import '../../../../components/custom_widget_page/stateless_custom.dart';
import 'allowed.section.dart';

class FeatureSection extends StatelessCustom {
  final ListingYachtBloc bloc;

  FeatureSection({Key? key, required this.bloc}) : super(key: key);

  final List<Allowed> allowedList = [
    Allowed(icon: FontAwesomeIcons.wind, name: "Air conditioning"),
    Allowed(icon: FontAwesomeIcons.anchor, name: "Anchor"),
    Allowed(icon: FontAwesomeIcons.bath, name: "Bathroom"),
    Allowed(icon: FontAwesomeIcons.volumeHigh, name: "Bluetooth audio"),
    Allowed(icon: FontAwesomeIcons.box, name: "Cooler ice chest"),
    Allowed(icon: FontAwesomeIcons.shower, name: "Deck shower"),
    Allowed(icon: FontAwesomeIcons.fish, name: "Fish finder"),
    Allowed(icon: FontAwesomeIcons.burger, name: "Grill"),
    Allowed(icon: FontAwesomeIcons.ferry, name: "Jet ski"),
    Allowed(icon: FontAwesomeIcons.solidSquareFull, name: "Refrigetator"),
    Allowed(icon: FontAwesomeIcons.fishFins, name: "Rod holders"),
    Allowed(icon: FontAwesomeIcons.mask, name: "Snorkeling gear"),
  ];
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Allowed>>(
      stream: bloc.featureStream,
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<Allowed>> snapshot) {
        return Container(
          padding: EdgeInsets.only(top: responsive.hp(3)),
          margin: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsive.wp(2),
                  vertical: responsive.hp(3),
                ),
                sliver: SliverGrid.count(
                  crossAxisCount: 3,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: List.generate(allowedList.length, (index) {
                    final active = (snapshot.data
                            ?.map<String>((e) => e.name)
                            .contains(allowedList[index].name)) ??
                        false;
                    return IconCard(
                      value: active,
                      allowed: allowedList[index],
                      onSelected: ((bool status) {
                        status
                            ? bloc.addFeature(allowedList[index])
                            : bloc.removeFeature(allowedList[index]);
                      }),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
