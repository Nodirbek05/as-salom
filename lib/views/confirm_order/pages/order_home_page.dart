import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';

class OrderHomePage extends StatefulWidget {
  static late Position position;
  static TextEditingController homeController = TextEditingController();
  static TextEditingController etajController = TextEditingController();
  static TextEditingController podezdController = TextEditingController();
  static TextEditingController kvController = TextEditingController();
  static TextEditingController commentController = TextEditingController();
  static TextEditingController nameController = TextEditingController();
  static TextEditingController adressController = TextEditingController();

  const OrderHomePage({super.key});

  @override
  State<OrderHomePage> createState() => _OrderHomePageState();
}

class _OrderHomePageState extends State<OrderHomePage> {
  @override
  void initState() {
    _getLocation();
    super.initState();
  }

  var phoneFormatter = MaskTextInputFormatter(
      mask: '##-###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  Future<Position> _getLocation() async {
    bool isServiceEnabled;
    LocationPermission permission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled && mounted) {
      'Please enable location';
      return Future.error('Location service is not enabled');
    }
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied && mounted) {
        'We do not have permission to access this location';
        return Future.error('Location permission denied');
      }
    }
    if (permission == LocationPermission.deniedForever && mounted) {
      'We do not have permission to access this location';
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Completer<YandexMapController> completer = Completer<YandexMapController>();

  late YandexMapController _yandexMapController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 15.h,
        left: 15.w,
        right: 15.w,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "delivery_address".tr(),
              style: Styles.styles700sp16Black,
            ),
            ScreenUtil().setVerticalSpacing(10),
            Container(
              height: 200.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ConstColor.assalomText,
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
              ),
              child: Stack(
                children: [
                  YandexMap(
                    onMapTap: (argument) {},
                    onObjectTap: (geoObject) {},
                    onUserLocationAdded: (view) {
                      return null;
                    },
                    onMapCreated: (YandexMapController controller) async {
                      OrderHomePage.position = await _getLocation();
                      getLocation(
                              lat: OrderHomePage.position.latitude,
                              lon: OrderHomePage.position.longitude)
                          .then((value) {
                        if (value is DataSuccess) {
                          setState(() {
                            OrderHomePage.adressController.text =
                                value.data?.displayname ?? "null";
                          });
                        }
                      });
                      _yandexMapController = controller;
                      _yandexMapController.moveCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                            zoom: 17,
                            target: Point(
                              latitude: OrderHomePage.position.latitude,
                              longitude: OrderHomePage.position.longitude,
                            ),
                          ),
                        ),
                      );
                    },
                    onCameraPositionChanged:
                        (cameraPosition, reason, finished) async {
                      if (finished) {
                        // bloc.add(
                        //   TryToGetLocationToMapEvent(
                        //     {
                        //       'lat': cameraPosition.target.latitude,
                        //       'lon': cameraPosition.target.longitude,
                        //     },
                        //   ),
                        // );
                      }
                    },
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.location_on_rounded,
                      color: ConstColor.assalomText,
                      size: 40,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: InkWell(
                      onTap: () async {
                        await _getLocation();
                        getLocation(
                          lat: OrderHomePage.position.latitude,
                          lon: OrderHomePage.position.longitude,
                        ).then((value) {
                          if (value is DataSuccess) {
                            setState(() {
                              OrderHomePage.adressController.text =
                                  value.data?.displayname ?? "null";
                            });
                          }
                        });
                        // print(getAddressFromLatLng(
                        //     _position.latitude, _position.longitude));
                        _yandexMapController.moveCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              zoom: 17,
                              target: Point(
                                latitude: OrderHomePage.position.latitude,
                                longitude: OrderHomePage.position.longitude,
                              ),
                            ),
                          ),
                        );
                      },
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundColor: ConstColor.assalomText,
                        child: Icon(CupertinoIcons.paperplane),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ScreenUtil().setVerticalSpacing(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 45.h,
                  width: 150.w,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.digitsOnly,
                    //   phoneFormatter
                    // ],
                    controller: OrderHomePage.homeController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 4.h, left: 10.w),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: ConstColor.assalomText),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: ConstColor.assalomText),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: ConstColor.assalomText),
                      ),
                      hintText: "flat".tr(),
                      hintStyle: Styles.style400sp16Black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 45.h,
                  width: 150.w,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.digitsOnly,
                    //   phoneFormatter
                    // ],
                    controller: OrderHomePage.etajController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 4.h, left: 10.w),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: ConstColor.assalomText),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: ConstColor.assalomText),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: ConstColor.assalomText),
                        ),
                        hintText: "stage".tr(),
                        hintStyle: Styles.style400sp16Black),
                  ),
                ),
              ],
            ),
            ScreenUtil().setVerticalSpacing(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 45.h,
                  width: 150.w,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.digitsOnly,
                    //   phoneFormatter
                    // ],
                    controller: OrderHomePage.podezdController,
                    decoration: InputDecoration(
                      hintText: "enterance".tr(),
                      hintStyle: Styles.style400sp16Black,
                      contentPadding: EdgeInsets.only(top: 4.h, left: 10.w),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: ConstColor.assalomText),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: ConstColor.assalomText),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: ConstColor.assalomText),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 45.h,
                  width: 150.w,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.digitsOnly,
                    //   phoneFormatter
                    // ],
                    controller: OrderHomePage.kvController,
                    decoration: InputDecoration(
                      hintText: "house".tr(),
                      hintStyle: Styles.style400sp16Black,
                      contentPadding: EdgeInsets.only(top: 4.h, left: 10.w),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: ConstColor.assalomText),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: ConstColor.assalomText),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: ConstColor.assalomText),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ScreenUtil().setVerticalSpacing(20),
            Text(
              "address".tr(),
              style: Styles.style400sp14Black,
            ),
            ScreenUtil().setVerticalSpacing(5),
            TextFormField(
              readOnly: true,
              maxLines: 4,
              controller: OrderHomePage.adressController,
              decoration: InputDecoration(
                hintText: "enter_address".tr(),
                hintStyle: Styles.style400sp16Black,
                contentPadding: EdgeInsets.only(top: 8.h, left: 10.w),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: ConstColor.assalomText),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: ConstColor.assalomText),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: ConstColor.assalomText),
                ),
              ),
            ),
            ScreenUtil().setVerticalSpacing(20),
            Text(
              "enter_name".tr(),
              style: Styles.style400sp14Black,
            ),
            ScreenUtil().setVerticalSpacing(5),
            TextFormField(
              maxLines: 1,
              controller: OrderHomePage.nameController,
              decoration: InputDecoration(
                hintText: "your_name".tr(),
                hintStyle: Styles.style400sp16Black,
                contentPadding: EdgeInsets.only(top: 4.h, left: 10.w),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: ConstColor.assalomText),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: ConstColor.assalomText),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: ConstColor.assalomText),
                ),
              ),
            ),
            const SizedBox(height: 100)
          ],
        ),
      ),
    );
  }

  Future<DataState> getLocation({
    required double lat,
    required double lon,
  }) async {
   
    try {
      Response response = await http.get(
        Uri.parse(
            "https://nominatim.openstreetmap.org/reverse?lat=$lat&lon=$lon&format=jsonv2"),
      );
      if (response.statusCode == 200) {
        return DataSuccess(AddressName.fromJson(response.body));
      } else {
        return const DataError();
      }
    } catch (e) {

      return const DataError();
    }
  }

  // void _onMapCreated(YandexMapController controller) {
  //   completer.complete(controller);
  // }
}

abstract class DataState {
  final AddressName? data;
  const DataState({
    this.data,
  });
}

class DataSuccess extends DataState {
  const DataSuccess(AddressName data) : super(data: data);
}

class DataError extends DataState {
  const DataError() : super();
}

class AddressName {
  String? displayname;
  AddressName({
    this.displayname,
  });

  AddressName copyWith({
    String? displayname,
  }) {
    return AddressName(
      displayname: displayname ?? this.displayname,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (displayname != null) {
      result.addAll({'display_name': displayname});
    }

    return result;
  }

  factory AddressName.fromMap(Map<String, dynamic> map) {
    return AddressName(
      displayname: map['display_name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressName.fromJson(String source) =>
      AddressName.fromMap(json.decode(source));

  @override
  String toString() => 'AddressName(display_name: $displayname)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddressName && other.displayname == displayname;
  }

  @override
  int get hashCode => displayname.hashCode;
}
