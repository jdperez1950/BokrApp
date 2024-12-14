import 'package:flutter/gestures.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../../blocs/listing_yacht.bloc.dart';
import '../../../components/custom_widget_page/statefull_custom.dart';
import '../../../models/title_listing.model.dart';
import '../ListingIntro.page.dart';

import 'section/allowed.section.dart';
import 'section/available.section.dart';
import 'section/cofirm.section.dart';
import 'section/days_required.section.dart';
import 'section/duration.section.dart';
import 'section/feature.section.dart';
import 'section/init_section.dart';
import 'section/international_trip.section.dart';
import 'section/map.section.dart';
import 'section/multipe_booking.section.dart';
import 'section/photos_section.dart';
import 'section/policy.section.dart';
import 'section/prepare_international_trip.section.dart';
import 'section/specifications_section.dart';
import 'section/things_know.section.dart';
import 'section/yacht_info.section.dart';

List<TitleListing> sections = [];

class YachtPage extends StateFullCustom {
  YachtPage({Key? key}) : super(key: key);
  @override
  State<YachtPage> createState() => _YachtPageState();
}

class _YachtPageState extends State<YachtPage> {
  late PageController _pageController;
  late ListingYachtBloc _bloc;

  late Future<dynamic> pageFuture;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _bloc = ListingYachtBloc();
    pageFuture = _bloc.pageChange();
    super.initState();
    buildDefaultTitle();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  buildDefaultTitle() {
    sections = [
      TitleListing(title: "", height: 10.0),
      TitleListing(
        title: "Where is your yacht located?",
        subtitle:
            "The exact location of your yacht will not be shown to guests or brokers until you have confirmed their trip.",
        height: 31.0,
      ),
      TitleListing(title: "Your yacht listing", height: 18.0),
      TitleListing(
        title: "Cancellation policy",
        subtitle: "Select how you want to handle trip cancellations.",
        height: 20.0,
      ),
      TitleListing(
        title: "Things to know",
        subtitle:
            "Tell guests things they should know before being on board and during their trip",
        height: 20.0,
      ),
      TitleListing(
        title: "Yacht rules",
        subtitle:
            "Tell guests things that are allowed and not allowed on your yacht",
        height: 20.0,
      ),
      TitleListing(title: "Yacht features", height: 18.0),
      TitleListing(title: "Yacht photos", height: 18.0),
      TitleListing(title: "Yacht specifications", height: 18.0),
      TitleListing(
        title: "Select your available days and  hours of operation",
        height: 20.0,
      ),
      TitleListing(
        title: "Select which durations you would like to offer",
        height: 20.0,
      ),
      TitleListing(
        title: "Do you want to allow multiple bookings in one day?",
        height: 20.0,
      ),
      TitleListing(
        title: "Would you like to offer intertational trips?",
        height: 20.0,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).padding;
    return Scaffold(
      body: KeyboardVisibilityBuilder(
        builder: (_, isKeyboardVisible) {
          return Container(
            padding: EdgeInsets.only(top: size.top),
            height: widget.responsive.hp(100),
            width: widget.responsive.wp(100),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  widget.colorsTheme.primary,
                  widget.colorsTheme.secondary,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [.001, .2, 1],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    width: widget.responsive.wp(100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StreamBuilder(
                          stream: _bloc.pageStream,
                          initialData: 0,
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            final title = sections[snapshot.data];
                            return AnimatedContainer(
                              padding: EdgeInsets.symmetric(
                                horizontal: widget.responsive.wp(6),
                              ),
                              duration: const Duration(milliseconds: 300),
                              height: widget.responsive.hp(title.height),
                              child: Center(
                                widthFactor: 1,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title.title,
                                      style: widget.fontSize.headline5(
                                        color: widget.colorsTheme.surface,
                                      ),
                                    ),
                                    title.subtitle != null
                                        ? Padding(
                                            padding: EdgeInsets.only(
                                              top: widget.responsive.hp(3),
                                            ),
                                            child: Text(
                                              "${title.subtitle}",
                                              style: widget.fontSize.subtitle2(
                                                color:
                                                    widget.colorsTheme.surface,
                                              ),
                                            ),
                                          )
                                        : Container()
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(10.0),
                                right: Radius.circular(10.0),
                              ),
                            ),
                            child: StreamBuilder(
                              stream: _bloc.internationalTripStream,
                              initialData: false,
                              builder:
                                  (BuildContext _, AsyncSnapshot snapshot) {
                                List<Widget> sectionPages = [
                                  InitSection(bloc: _bloc),
                                  MapSection(bloc: _bloc),
                                  YachtInfoSection(bloc: _bloc),
                                  PolicySection(bloc: _bloc),
                                  ThingsKnowSection(bloc: _bloc),
                                  AllowedSection(bloc: _bloc),
                                  FeatureSection(bloc: _bloc),
                                  PhotoSection(bloc: _bloc),
                                  SpecificationSection(bloc: _bloc),
                                  AvailableSection(bloc: _bloc),
                                  DurationSection(bloc: _bloc),
                                  MultipleBookingSection(bloc: _bloc),
                                  InternationTripSection(bloc: _bloc)
                                ];
                                buildDefaultTitle();
                                if (snapshot.data) {
                                  sectionPages.add(
                                      PrepareInternationalTripSection(
                                          bloc: _bloc));
                                  sectionPages
                                      .add(DaysRequiredSection(bloc: _bloc));

                                  sections.add(TitleListing(
                                    title:
                                        "How much time do you need to prepare for an international trip?",
                                    height: 20.0,
                                  ));
                                  sections.add(TitleListing(
                                    title:
                                        "How many days minimun you require for an international trip?",
                                    height: 20.0,
                                  ));
                                }

                                sections.add(TitleListing(
                                  title:
                                      "Please review your yacht listing before submitting",
                                  height: 20.0,
                                ));

                                sectionPages.add(ConfirmSection(bloc: _bloc));
                                return PageView(
                                  controller: _pageController,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: sectionPages,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                !isKeyboardVisible
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 10.0,
                        ),
                        height: 80.0,
                        width: widget.responsive.wp(100),
                        color: widget.colorsTheme.surface,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Text.rich(
                                TextSpan(
                                  text: "Back",
                                  style: widget.fontSize.bodyText1().copyWith(
                                        decoration: TextDecoration.underline,
                                      ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      _pageController
                                          .previousPage(
                                            duration: const Duration(
                                                milliseconds: 100),
                                            curve: Curves.linear,
                                          )
                                          .then((value) => _bloc.addPage(
                                              _pageController.page?.toInt() ??
                                                  0));
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                ),
                              ),
                            ),
                            StreamBuilder(
                              stream: _bloc.pageStream,
                              initialData: 0,
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                print("page ====>>>> ${_pageController.page}");
                                return StreamBuilder<bool>(
                                  key: Key(snapshot.data.toString()),
                                  stream: _bloc.getValidation(
                                      _pageController.page?.toInt() ?? 0),
                                  initialData: false,
                                  builder: (BuildContext _,
                                      AsyncSnapshot<bool> active) {
                                    print("validation ===>>>>> $active");
                                    return SizedBox(
                                      width: 170,
                                      child: GradientButton(
                                        text:
                                            snapshot.data == sections.length - 1
                                                ? "Submit"
                                                : "Continue",
                                        onPressed: active.data!
                                            ? () {
                                                _pageController
                                                    .nextPage(
                                                      duration: const Duration(
                                                          milliseconds: 100),
                                                      curve: Curves.linear,
                                                    )
                                                    .then((value) =>
                                                        _bloc.addPage(
                                                            _pageController.page
                                                                    ?.toInt() ??
                                                                0));
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              }
                                            : null,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          );
        },
      ),
    );
  }
}
