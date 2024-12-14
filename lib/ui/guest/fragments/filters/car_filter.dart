import 'package:brokr/ui/widgets/aux_dropdown.dart';
import 'package:brokr/ui/widgets/aux_radio.dart';
import 'package:brokr/ui/widgets/aux_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterCarWidget extends StatefulWidget {
  const FilterCarWidget({Key? key}) : super(key: key);

  @override
  _FilterCarWidgetState createState() => _FilterCarWidgetState();
}

class _FilterCarWidgetState extends State<FilterCarWidget> {
  String? dropDownValue1;
  double? sliderValue;
  String? dropDownValue2;
  String? dropDownValue3;
  String? dropDownValue4;
  String? dropDownValue5;
  String? radioButtonValue1;
  String? radioButtonValue2;
  String? radioButtonValue3;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final Color bg = Colors.white;
  final Color gr = Colors.grey.shade600;
  late TextStyle ts = TextStyle();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
      ts = Theme.of(context).textTheme.bodyText1!.copyWith(
            fontFamily: 'Overpass',
            color: Colors.black,
            fontWeight: FontWeight.normal,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Text(
                  'Sort by ',
                  style: ts,
                ),
              ),
              const Spacer(),
              FlutterFlowDropDown<String>(
                options: ['Option 1'],
                onChanged: (val) => setState(() => dropDownValue1 = val),
                width: 120,
                height: 36,
                textStyle: ts,
                hintText: 'Relevance',
                fillColor: Color(0xFFEFEFF0),
                elevation: 2,
                borderColor: Colors.transparent,
                borderWidth: 0,
                borderRadius: 18,
                margin: EdgeInsetsDirectional.fromSTEB(20, 4, 8, 4),
                hidesUnderline: true,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 180, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Price',
                        // style: FlutterFlowTheme.of(context).bodyText1.override(
                        //       fontFamily: 'Overpass',
                        //       color: Colors.black,
                        //       fontSize: 16,
                        //     ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: Slider(
                    activeColor: Theme.of(context).primaryColor,
                    inactiveColor: gr,
                    min: 10,
                    max: 2500,
                    value: sliderValue ??= 125,
                    label: sliderValue.toString(),
                    divisions: 249,
                    onChanged: (newValue) {
                      setState(() => sliderValue = newValue);
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Text(
                  'Make',
                  style: ts,
                ),
              ),
              const Spacer(),
              FlutterFlowDropDown<String>(
                options: ['Option 1'],
                onChanged: (val) => setState(() => dropDownValue2 = val),
                width: 120,
                height: 36,
                textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontFamily: 'Overpass',
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                hintText: 'All makes',
                fillColor: Color(0xFFEFEFF0),
                elevation: 2,
                borderColor: Colors.transparent,
                borderWidth: 0,
                borderRadius: 18,
                margin: EdgeInsetsDirectional.fromSTEB(20, 4, 8, 4),
                hidesUnderline: true,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Text(
                    'Years   ',
                    style: ts,
                  ),
                ),
                const Spacer(),
                FlutterFlowDropDown<String>(
                  options: ['Option 1'],
                  onChanged: (val) => setState(() => dropDownValue3 = val),
                  width: 120,
                  height: 36,
                  textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontFamily: 'Overpass',
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                  hintText: 'All years',
                  fillColor: Color(0xFFEFEFF0),
                  elevation: 2,
                  borderColor: Colors.transparent,
                  borderWidth: 0,
                  borderRadius: 18,
                  margin: EdgeInsetsDirectional.fromSTEB(20, 4, 8, 4),
                  hidesUnderline: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Text(
                    'Length',
                    style: ts,
                  ),
                ),
                const Spacer(),
                FlutterFlowDropDown<String>(
                  options: ['Option 1'],
                  onChanged: (val) => setState(() => dropDownValue4 = val),
                  width: 120,
                  height: 36,
                  textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontFamily: 'Overpass',
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                  hintText: 'All lengths',
                  fillColor: Color(0xFFEFEFF0),
                  elevation: 2,
                  borderColor: Colors.transparent,
                  borderWidth: 0,
                  borderRadius: 18,
                  margin: EdgeInsetsDirectional.fromSTEB(20, 4, 8, 4),
                  hidesUnderline: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Text(
                    'Vehicle type ',
                    style: ts,
                  ),
                ),
                const Spacer(),
                FlutterFlowDropDown<String>(
                  options: ['Option 1'],
                  onChanged: (val) => setState(() => dropDownValue5 = val),
                  width: 120,
                  height: 36,
                  textStyle: ts,
                  hintText: 'All types',
                  fillColor: Color(0xFFEFEFF0),
                  elevation: 2,
                  borderColor: Colors.transparent,
                  borderWidth: 0,
                  borderRadius: 18,
                  margin: EdgeInsetsDirectional.fromSTEB(20, 4, 8, 4),
                  hidesUnderline: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Text(
                    'Unlimited miles',
                    style: ts,
                  ),
                ),
                const Spacer(),
                FlutterFlowRadioButton(
                  options: [' '].toList(),
                  onChanged: (val) => setState(() => radioButtonValue1 = val),
                  optionHeight: 25,
                  textStyle: ts,
                  buttonPosition: RadioButtonPosition.left,
                  direction: Axis.vertical,
                  radioButtonColor: Colors.blue,
                  inactiveRadioButtonColor: Color(0x8A000000),
                  toggleable: false,
                  horizontalAlignment: WrapAlignment.start,
                  verticalAlignment: WrapCrossAlignment.start,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Text('Delivered to you', style: ts),
                ),
                const Spacer(),
                FlutterFlowRadioButton(
                  options: [' '].toList(),
                  onChanged: (val) => setState(() => radioButtonValue2 = val),
                  optionHeight: 25,
                  textStyle: ts,
                  buttonPosition: RadioButtonPosition.left,
                  direction: Axis.vertical,
                  radioButtonColor: Colors.blue,
                  inactiveRadioButtonColor: Color(0x8A000000),
                  toggleable: false,
                  horizontalAlignment: WrapAlignment.start,
                  verticalAlignment: WrapCrossAlignment.start,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Text(
                    'Free cancelation policy',
                    style: ts,
                  ),
                ),
                const Spacer(),
                FlutterFlowRadioButton(
                  options: [' '].toList(),
                  onChanged: (val) => setState(() => radioButtonValue3 = val),
                  optionHeight: 25,
                  textStyle: ts,
                  //buttonPosition: RadioButtonPosition.left,
                  direction: Axis.vertical,
                  radioButtonColor: Colors.blue,
                  inactiveRadioButtonColor: Color(0x8A000000),
                  toggleable: false,
                  horizontalAlignment: WrapAlignment.start,
                  verticalAlignment: WrapCrossAlignment.start,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Features',
                  style: ts,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4.3,
                        decoration: BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.grey.shade600,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 48,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                              ),
                              child: Icon(
                                Icons.accessible_outlined,
                                color: Colors.black,
                                size: 40,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                'Wheelchair Accesible',
                                textAlign: TextAlign.center,
                                // style: FlutterFlowTheme.of(context)
                                //     .bodyText1
                                //     .override(
                                //       fontFamily: 'Overpass',
                                //       fontSize: 10,
                                //     ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4.3,
                        decoration: BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.grey.shade600,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 48,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                              ),
                              child: Icon(
                                Icons.escalator_sharp,
                                color: Colors.black,
                                size: 40,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                'All Wheel Drive',
                                textAlign: TextAlign.center,
                                // style: FlutterFlowTheme.of(context)
                                //     .bodyText1
                                //     .override(
                                //       fontFamily: 'Overpass',
                                //       fontSize: 10,
                                //     ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4.3,
                        height: 80,
                        decoration: BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.grey.shade600,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 48,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                              ),
                              child: Icon(
                                Icons.android,
                                color: Colors.black,
                                size: 40,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                'Android Auto',
                                textAlign: TextAlign.center,
                                // style: FlutterFlowTheme.of(context)
                                //     .bodyText1
                                //     .override(
                                //       fontFamily: 'Overpass',
                                //       fontSize: 10,
                                //     ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.3,
                      height: 80,
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Icon(
                                Icons.apple,
                                color: Colors.black,
                                size: 40,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Apple Car Play',
                              textAlign: TextAlign.center,
                              style: ts.copyWith(
                                fontFamily: 'Overpass',
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.3,
                      height: 80,
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            child: Icon(
                              Icons.auto_fix_high,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'AUX Input',
                              textAlign: TextAlign.center,
                              style: ts.copyWith(
                                fontFamily: 'Overpass',
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.3,
                      height: 80,
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            child: Icon(
                              Icons.switch_camera_outlined,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Backup Camera',
                              textAlign: TextAlign.center,
                              style: ts.copyWith(
                                fontFamily: 'Overpass',
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.3,
                      height: 80,
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            child: Icon(
                              Icons.directions_bike_rounded,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Bike Rack',
                              textAlign: TextAlign.center,
                              style: ts.copyWith(
                                fontFamily: 'Overpass',
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.3,
                      height: 80,
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            child: Icon(
                              Icons.layers_outlined,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Blind Spot Warning',
                              textAlign: TextAlign.center,
                              style: ts.copyWith(
                                fontFamily: 'Overpass',
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.3,
                      height: 80,
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            child: Icon(
                              Icons.bluetooth,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Bluetooth',
                              textAlign: TextAlign.center,
                              style: ts.copyWith(
                                fontFamily: 'Overpass',
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.3,
                      height: 80,
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            child: Icon(
                              Icons.child_care,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Child Seat',
                              textAlign: TextAlign.center,
                              style: ts.copyWith(
                                fontFamily: 'Overpass',
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.3,
                      height: 80,
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            child: Icon(
                              Icons.king_bed_outlined,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Convertible',
                              textAlign: TextAlign.center,
                              style: ts.copyWith(
                                fontFamily: 'Overpass',
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.3,
                      height: 80,
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            child: Icon(
                              Icons.gps_fixed,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'GPS',
                              textAlign: TextAlign.center,
                              style: ts.copyWith(
                                fontFamily: 'Overpass',
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.3,
                      height: 80,
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            child: Icon(
                              Icons.height,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Heated Seats',
                              textAlign: TextAlign.center,
                              style: ts.copyWith(
                                fontFamily: 'Overpass',
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.3,
                      height: 80,
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            child: Icon(
                              Icons.vpn_key_outlined,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Keyless Entry',
                              textAlign: TextAlign.center,
                              style: ts.copyWith(
                                fontFamily: 'Overpass',
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.3,
                      height: 80,
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            child: Icon(
                              Icons.usb,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'USB Input',
                              textAlign: TextAlign.center,
                              style: ts.copyWith(
                                fontFamily: 'Overpass',
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.3,
                      height: 80,
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            child: Icon(
                              Icons.pets,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Pet Friendly',
                              textAlign: TextAlign.center,
                              style: ts.copyWith(
                                fontFamily: 'Overpass',
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.3,
                      height: 80,
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            child: Icon(
                              Icons.stacked_line_chart_outlined,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Ski Rack',
                              textAlign: TextAlign.center,
                              style: ts.copyWith(
                                fontFamily: 'Overpass',
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.3,
                      height: 80,
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            child: Icon(
                              Icons.graphic_eq_sharp,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Snow Tires / Chains',
                              textAlign: TextAlign.center,
                              style: ts.copyWith(
                                fontFamily: 'Overpass',
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        'Clear all',
                        // style: FlutterFlowTheme.of(context).bodyText1.override(
                        //       fontFamily: 'Overpass',
                        //       decoration: TextDecoration.underline,
                        //     ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(150, 0, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Show 129 Cars',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          // color: FlutterFlowTheme.of(context).primaryColor,
                          // textStyle: FlutterFlowTheme.of(context)
                          //     .bodyText1
                          //     .override(
                          //       fontFamily: 'Overpass',
                          //       // color:
                          //       //     FlutterFlowTheme.of(context).primaryBtnText,
                          //       fontWeight: FontWeight.w500,
                          //     ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
