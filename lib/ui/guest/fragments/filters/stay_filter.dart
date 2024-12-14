import 'package:brokr/ui/widgets/aux_dropdown.dart';
import 'package:brokr/ui/widgets/aux_widgets.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterStayWidget extends StatefulWidget {
  const FilterStayWidget({Key? key}) : super(key: key);

  @override
  _FilterStayWidgetState createState() => _FilterStayWidgetState();
}

class _FilterStayWidgetState extends State<FilterStayWidget> {
  String? dropDownValue;
  double? sliderValue;
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
                onChanged: (val) => setState(() => dropDownValue = val),
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
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Container(
                      width: 150,
                      height: 90,
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
                              Icons.house,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'House',
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
                      width: 150,
                      height: 90,
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
                              Icons.apartment,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Apartment',
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
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Container(
                      width: 150,
                      height: 90,
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
                              Icons.business,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Mansion',
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
                      width: 150,
                      height: 90,
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
                              Icons.api,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Tonwhouse',
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Bedrooms',
                  style: ts,
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 8, 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 6,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Any',
                              textAlign: TextAlign.center,
                              // style: FlutterFlowTheme.of(context)
                              //     .bodyText1
                              //     .override(
                              //       fontFamily: 'Overpass',
                              //       color: FlutterFlowTheme.of(context)
                              //           .primaryBtnText,
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
                      width: MediaQuery.of(context).size.width / 6,
                      height: 30,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              '1',
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
                      width: MediaQuery.of(context).size.width / 6,
                      height: 30,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              '2',
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
                      width: MediaQuery.of(context).size.width / 6,
                      height: 30,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              '3',
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Beds',
                  style: ts,
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 8, 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 6,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Any',
                              textAlign: TextAlign.center,
                              // style: FlutterFlowTheme.of(context)
                              //     .bodyText1
                              //     .override(
                              //       fontFamily: 'Overpass',
                              //       color: FlutterFlowTheme.of(context)
                              //           .primaryBtnText,
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
                      width: MediaQuery.of(context).size.width / 6,
                      height: 30,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              '1',
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
                      width: MediaQuery.of(context).size.width / 6,
                      height: 30,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              '2',
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
                      width: MediaQuery.of(context).size.width / 6,
                      height: 30,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              '3',
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Bathrooms',
                  style: ts,
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 8, 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 6,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Any',
                              textAlign: TextAlign.center,
                              // style: FlutterFlowTheme.of(context)
                              //     .bodyText1
                              //     .override(
                              //       fontFamily: 'Overpass',
                              //       color: FlutterFlowTheme.of(context)
                              //           .primaryBtnText,
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
                      width: MediaQuery.of(context).size.width / 6,
                      height: 30,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              '1',
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
                      width: MediaQuery.of(context).size.width / 6,
                      height: 30,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              '2',
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
                      width: MediaQuery.of(context).size.width / 6,
                      height: 30,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              '3',
                              textAlign: TextAlign.center,
                              style: ts,
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
            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Amenities',
                  style: ts,
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
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
                              Icons.foundation,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Waterfront',
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
                              Icons.beach_access,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Beachfront',
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
                              Icons.pool,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Pool',
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
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
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
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
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
                              Icons.hot_tub,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Hot tub',
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
                              Icons.tv,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'TV',
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
                              alignment: AlignmentDirectional(0, -0.2),
                              child: FaIcon(
                                FontAwesomeIcons.gem,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Gym',
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
                              Icons.grain,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Garage',
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
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Divider(
              thickness: 1,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        'Clear all',
                        style: ts,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(150, 0, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Show 129 Stay',
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
