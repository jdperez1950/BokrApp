import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../utils/calendar_utils.dart';
import '../../../../utils/theme_utils.dart';
import '../../../widgets/tiles/asset_tile_widget.dart';

class RequestsFragment extends StatefulWidget {
  @override
  _RequestsFragmentState createState() => _RequestsFragmentState();
}

//final tripController = Get.put(TripFragmentController());
class _RequestsFragmentState extends State<RequestsFragment> {
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

  bool get canClearSelection =>
      _selectedDays.isNotEmpty || _rangeStart != null || _rangeEnd != null;

  List<Event> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
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
      body: Column(
        children: [
          SizedBox(
            width: 400,
            child: _isCalendarVisible
                ? Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              iconSize: 20,
                              icon: const Icon(
                                Icons.calendar_today,
                              ),
                              onPressed: () {
                                setState(
                                  () {
                                    _isCalendarVisible = false;
                                  },
                                );
                              },
                            ),
                          ]),
                      calendarTab()
                    ],
                  )
                : Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    IconButton(
                      iconSize: 20,
                      icon: const Icon(
                        Icons.calendar_today,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            _isCalendarVisible = true;
                          },
                        );
                      },
                    ),
                  ]),
          ),
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: assetList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Center(child: assetList[index]),
                    );
                  }))
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
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              side: BorderSide(color: Colors.black, width: .5),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TableCalendar<Event>(
                  firstDay: kFirstDay,
                  lastDay: kLastDay,
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
                  onCalendarCreated: (controller) =>
                      _pageController = controller,
                  onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
                  calendarBuilders: CalendarBuilders(
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
                )
              ],
            )),
      ],
    );
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
