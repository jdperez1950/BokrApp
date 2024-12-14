import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../blocs/listing_yacht.bloc.dart';
import '../../../../components/custom_widget_page/stateless_custom.dart';
import '../../../widgets/CustomOutlineInputField.dart';
import '../../car/section/policy_cancellation.section.dart';

class InternationTripSection extends StatelessCustom {
  final ListingYachtBloc bloc;

  InternationTripSection({super.key, required this.bloc});

  // final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CompositionValue<List<String>>>(
      stream: bloc.mergeInternationalTrip,
      initialData: CompositionValue<List<String>>(a: true, b: []),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final CompositionValue<List<String>> state = snapshot.data;
        return Container(
          padding: EdgeInsets.only(top: responsive.hp(3)),
          margin: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    CardItemPolicy(
                      active: !state.a,
                      title: "No",
                      onClick: () {
                        bloc.addInternationalTrip(false);
                        bloc.addTimePrepareITrip([]);
                      },
                      body: const Text(
                        "This yacht can only be booked once a day",
                      ),
                    ),
                    SizedBox(height: responsive.hp(3)),
                    CardItemPolicy(
                      active: state.a,
                      title: "Yes",
                      onClick: () => bloc.addInternationalTrip(true),
                      body: const Text(
                        "How much time you need to prepare in between trips?",
                      ),
                    ),
                    SizedBox(height: responsive.hp(3)),
                    Row(
                      children: [
                        Expanded(
                          child: CustomOutlineInputField(
                            label: "",
                            onChanged: bloc.addDestination,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            bloc.pushDestination();
                          },
                          icon: const FaIcon(FontAwesomeIcons.plus),
                        ),
                      ],
                    ),
                    SizedBox(height: responsive.hp(3)),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  List.generate(
                    state.b.length,
                    (index) => Row(
                      children: [
                        Expanded(child: Text(state.b[index])),
                        IconButton(
                          onPressed: () => bloc.removeDestination(index),
                          icon: const FaIcon(FontAwesomeIcons.minus),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
