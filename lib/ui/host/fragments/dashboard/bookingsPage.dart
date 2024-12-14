import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../utils/calendar_utils.dart';
import '../../../../utils/theme_utils.dart';
import '../../../widgets/columnBuilderWidget.dart';
import '../../../widgets/tiles/asset_tile_widget.dart';
import '../../../widgets/tiles/buttonTileWidget.dart';

class BookingsPage extends StatefulWidget {
  //final controller = Get.put(BookingsPageController());

  @override
  _BookingsPageState createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  final List<bool> _selectedAsset = <bool>[true, false, false, false];

  final _duration = const Duration(milliseconds: 300);
  bool _showFab = true;

  late final ValueNotifier<List<Event>> _selectedEvents;
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  late PageController _pageController;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  DateTime _iFocusedDay = DateTime.now();

  DateTime? _selectedDay;

  var _isCalendarVisible = false;

  @override
  void initState() {
    super.initState();

    _selectedDays.add(_focusedDay.value);
    _selectedEvents = ValueNotifier(_getEventsForDay(_focusedDay.value));
  }

  @override
  void dispose() {
    _focusedDay.dispose();
    _selectedEvents.dispose();
    super.dispose();
  }

  List<AssetTile> assetList = [
    const AssetTile(
      owner: "Luis",
      title: "Lambo",
      endDate: 'Mon, Oct 10',
      startDate: 'Fri, Oct 07',
      status: "verified",
      imagePath:
          'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=1200',
    ),
    const AssetTile(
      owner: "Ray",
      title: "Lambo",
      endDate: 'Mon, Oct 10',
      startDate: 'Fri, Oct 07',
      status: "verified",
      imagePath:
          'https://imageio.forbes.com/specials-images/imageserve/6064c6802c761b99a89d1f21/0x0.jpg?format=jpg&crop=2375,1336,x0,y120,safe&width=1200',
    ),
    const AssetTile(
      owner: "Pauli",
      title: "Lambo",
      endDate: 'Mon, Oct 10',
      startDate: 'Fri, Oct 07',
      status: "Verified",
      imagePath:
          'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=1200',
    ),
    const AssetTile(
      owner: "Paul",
      title: "Lambo",
      endDate: 'Mon, Oct 10',
      startDate: 'Fri, Oct 07',
      status: "Verified",
      imagePath:
          'https://imageio.forbes.com/specials-images/imageserve/5f962d31e7b04bbfd2f68758/Bugatti-Chiron-Super-Sport-300--Driving/960x0.jpg?height=473&width=711&fit=bounds',
    ),
  ].reversed.toList();

  bool get canClearSelection =>
      _selectedDays.isNotEmpty || _rangeStart != null || _rangeEnd != null;

  List<Event> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  final maxHeight = 300.0;
  final minHeight = 100.0;
  double height = 300;
  bool gestureUp = false;

  @override
  Widget build(BuildContext context) => Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AnimatedSlide(
        duration: _duration,
        offset: _showFab ? Offset.zero : const Offset(0, 2),
        child: AnimatedOpacity(
          duration: _duration,
          opacity: _showFab ? 1 : 0,
          child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: ThemeUtils.gradientButton,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/list_icon.svg',
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Add',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.white, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 1,
                  color: Colors.white,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/filter_icon.svg'),
                        const SizedBox(width: 10),
                        Text(
                          'Filter',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text(
          'Bookings',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: ToggleButtons(
                renderBorder: false,
                fillColor: Colors.white,
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < _selectedAsset.length; i++) {
                      _selectedAsset[i] = i == index;
                    }
                  });
                },
                isSelected: _selectedAsset,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.1),
                    child: ButtonTile(
                        height: 90,
                        width: 90,
                        child: Column(
                          children: [
                            const Icon(Icons.car_rental),
                            const Text("Cars")
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.1),
                    child: ButtonTile(
                        height: 90,
                        width: 90,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.house_outlined),
                            const Text(
                              "Properties",
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.1),
                    child: ButtonTile(
                        height: 90,
                        width: 90,
                        child: Column(
                          children: [
                            const Icon(Icons.car_rental),
                            const Text("Boats")
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.1),
                    child: ButtonTile(
                        height: 90,
                        width: 90,
                        child: Column(
                          children: [
                            const Icon(Icons.car_rental),
                            const Text("Yacht")
                          ],
                        )),
                  )
                ]),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                GestureDetector(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        const begin = Offset(0, 1);
                        const end = Offset.zero;
                        final tween = Tween(begin: begin, end: end);
                        final offsetAnimation = animation.drive(tween);
                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                      child: gestureUp ? calendarTab() : bigCalendar(),
                    ),
                    onVerticalDragUpdate: (details) {
                      setState(() {
                        if (0 < details.delta.dy)
                          gestureUp = false;
                        else
                          gestureUp = true;
                      });
                    }),
                gestureUp
                    ? ColumnBuilder(
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Center(child: assetList[index]),
                          );
                        },
                        itemCount: assetList.length,
                      )
                    // ? ListView.separated(
                    //     shrinkWrap: true,
                    //     padding: const EdgeInsets.all(8),
                    //     itemCount: assetList.length,
                    //     itemBuilder: (BuildContext context, int index) {
                    //       return Container(
                    //         child: Center(child: assetList[index]),
                    //       );
                    //     },
                    //     separatorBuilder: (BuildContext context, int index) {
                    //       return Divider(
                    //         color: Colors.black,
                    //         indent: 40,
                    //         endIndent: 40,
                    //       );
                    //     },
                    //   )
                    : SizedBox(),
              ],
            ),
          )
        ],
      ));

  Widget calendarTab() {
    return Column(
      children: [
        ValueListenableBuilder<DateTime>(
          valueListenable: _focusedDay,
          builder: (context, value, _) {
            return _CalendarHeader(
              focusedDay: value,
              clearButtonVisible: canClearSelection,
              onLeftArrowTap: () {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              },
              onRightArrowTap: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              },
            );
          },
        ),
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            side: BorderSide(color: Colors.black, width: .5),
          ),
          child: TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            rowHeight: 42,
            focusedDay: _focusedDay.value,
            headerVisible: false,
            selectedDayPredicate: (day) => _selectedDays.contains(day),
            calendarFormat: _calendarFormat,
            eventLoader: _getEventsForDay,
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            rangeSelectionMode: _rangeSelectionMode,
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _iFocusedDay = focusedDay;
                  _rangeStart = null; // Important to clean those
                  _rangeEnd = null;
                  _rangeSelectionMode = RangeSelectionMode.toggledOff;
                });
              }
            },
            onRangeSelected: (start, end, focusedDay) {
              setState(() {
                _selectedDay = null;
                _iFocusedDay = focusedDay;
                _rangeStart = start;
                _rangeEnd = end;
                _rangeSelectionMode = RangeSelectionMode.toggledOn;
              });
            },
            onCalendarCreated: (controller) => _pageController = controller,
            onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, day, events) {
                return _getEventsForDay(day).isBlank == true
                    ? Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        alignment: Alignment.center,
                        child: Text(""),
                      )
                    : Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        alignment: Alignment.topCenter,
                        child: CircleAvatar(
                            backgroundColor: Colors.purple,
                            radius: 20,
                            child: Text(
                              DateFormat('d').format(day),
                              style: TextStyle(color: Colors.white),
                            )),
                      );
              },
              dowBuilder: (context, day) {
                var text = "ss";
                switch (day.weekday) {
                  case DateTime.sunday:
                    text = "S";
                    break;
                  case DateTime.monday:
                    text = "M";
                    break;
                  case DateTime.tuesday:
                    text = "T";
                    break;
                  case DateTime.wednesday:
                    text = "W";
                    break;
                  case DateTime.thursday:
                    text = "T";
                    break;
                  case DateTime.friday:
                    text = "F";
                    break;
                  case DateTime.saturday:
                    text = "S";
                    break;
                }

                return Center(
                  child: Text(
                    text,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget bigCalendar() {
    return Column(
      children: [
        ValueListenableBuilder<DateTime>(
          valueListenable: _focusedDay,
          builder: (context, value, _) {
            return _CalendarHeader(
              focusedDay: value,
              clearButtonVisible: canClearSelection,
              onLeftArrowTap: () {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              },
              onRightArrowTap: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              },
            );
          },
        ),
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            side: BorderSide(color: Colors.black, width: .5),
          ),
          child: TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay.value,
            headerVisible: false,
            rowHeight: 100,
            daysOfWeekHeight: 30,
            selectedDayPredicate: (day) => _selectedDays.contains(day),
            calendarFormat: _calendarFormat,
            eventLoader: _getEventsForDay,
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            rangeSelectionMode: _rangeSelectionMode,
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _iFocusedDay = focusedDay;
                  _rangeStart = null; // Important to clean those
                  _rangeEnd = null;
                  _rangeSelectionMode = RangeSelectionMode.toggledOff;
                });
              }
            },
            onRangeSelected: (start, end, focusedDay) {
              setState(() {
                _selectedDay = null;
                _iFocusedDay = focusedDay;
                _rangeStart = start;
                _rangeEnd = end;
                _rangeSelectionMode = RangeSelectionMode.toggledOn;
              });
            },
            onCalendarCreated: (controller) => _pageController = controller,
            onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
            calendarBuilders: CalendarBuilders(
              prioritizedBuilder: (context, day, focusedDay) {
                return Container(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  alignment: Alignment.topCenter,
                  child: Text(DateFormat('d').format(day)),
                );
              },
              markerBuilder: (BuildContext context, date, events) {
                if (events.isEmpty) return SizedBox();
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: events.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.all(1),
                                child: Container(
                                  child: Text(
                                    "Reserva",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  width: 3, // for horizontal axis
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.primaries[Random()
                                          .nextInt(Colors.primaries.length)]),
                                ),
                              );
                            }))
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget addFAB() {
    return SizedBox(
        height: 40,
        child: Container(
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(50.0),
              ),
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  transform: GradientRotation(7 * pi / 4),
                  colors: [const Color(0xff8B2FE0), const Color(0xff508FF7)])),
          child: FloatingActionButton.extended(
            heroTag: "add",
            icon: const Icon(Icons.edit_outlined),
            backgroundColor: Colors.transparent,
            shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(0), right: Radius.circular(50.0))),
            label: const Text('Add'),
            onPressed: () {},
          ),
        ));
  }

  Widget filterFAB() {
    return SizedBox(
        height: 40,
        child: Container(
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(50.0),
              ),
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  transform: GradientRotation(7 * pi / 4),
                  colors: [Colors.purple, Colors.blue])),
          child: FloatingActionButton.extended(
            heroTag: "filter",
            icon: const Icon(Icons.filter_alt_outlined),
            backgroundColor: Colors.transparent,
            shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(0), right: Radius.circular(50.0))),
            label: const Text('Filter'),
            onPressed: () {},
          ),
        ));
  }
}

class _CalendarHeader extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;

  final bool clearButtonVisible;

  const _CalendarHeader({
    Key? key,
    required this.focusedDay,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
    required this.clearButtonVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerText = DateFormat.yMMM().format(focusedDay);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: onLeftArrowTap,
          ),
          const SizedBox(width: 16.0),
          Text(
            headerText,
            style: const TextStyle(fontSize: 18.0),
          ),
          const SizedBox(width: 16.0),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: onRightArrowTap,
          ),
        ],
      ),
    );
  }
}
