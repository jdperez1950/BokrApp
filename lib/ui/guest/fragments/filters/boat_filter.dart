import 'package:brokr/ui/widgets/aux_dropdown.dart';
import 'package:brokr/ui/widgets/aux_radio.dart';
import 'package:brokr/ui/widgets/aux_widgets.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterBoatWidget extends StatefulWidget {
  const FilterBoatWidget({Key? key}) : super(key: key);

  @override
  _FilterBoatWidgetState createState() => _FilterBoatWidgetState();
}

class _FilterBoatWidgetState extends State<FilterBoatWidget> {
  String? dropDownValue1;
  double? sliderValue;
  String? dropDownValue2;
  String? dropDownValue3;
  String? dropDownValue4;
  String? dropDownValue5;
  String? radioButtonValue;
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
                        style: ts,
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
                textStyle: ts,
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
                  textStyle: ts,
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
                  textStyle: ts,
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
                    'Boat type ',
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
                    'Free cancelation policy',
                    style: ts,
                  ),
                ),
                const Spacer(),
                FlutterFlowRadioButton(
                  options: [' '].toList(),
                  onChanged: (val) => setState(() => radioButtonValue = val),
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
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
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
                        width: MediaQuery.of(context).size.width / 6,
                        height: MediaQuery.of(context).size.width / 6,
                        decoration: BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: gr,
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
                                Icons.hvac,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                'Jacuzzi',
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
                        width: MediaQuery.of(context).size.width / 6,
                        height: MediaQuery.of(context).size.width / 6,
                        decoration: BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: gr,
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
                                Icons.fiber_smart_record_rounded,
                                color: Colors.black,
                                size: 40,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                'Jet-ski',
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
                        width: MediaQuery.of(context).size.width / 6,
                        height: MediaQuery.of(context).size.width / 6,
                        decoration: BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: gr,
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
                                alignment: AlignmentDirectional(-0.2, 0),
                                child: FaIcon(
                                  FontAwesomeIcons.superpowers,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                'Water toys',
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
                        width: MediaQuery.of(context).size.width / 6,
                        height: MediaQuery.of(context).size.width / 6,
                        decoration: BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: gr,
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
                                Icons.wifi,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                'WiFi',
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
                        style: ts.copyWith(
                          fontFamily: 'Overpass',
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(150, 0, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Show 129 Boat',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: Theme.of(context).primaryColor,
                          textStyle: ts,
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
