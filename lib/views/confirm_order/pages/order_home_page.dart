import 'dart:async';

import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/auth/components/input_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class OrderHomePage extends StatefulWidget {
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

  Future<void> _getLocation() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        // Handle the case when the user doesn't enable location services.
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        // Handle the case when the user doesn't grant location permission.
        return;
      }
    }

    _locationData = await location.getLocation();
    // Now you have the user's location in _locationData.
    print(_locationData.latitude);
    print(_locationData.longitude);
  }

  TextEditingController homeController = TextEditingController();

  TextEditingController etajController = TextEditingController();

  TextEditingController commentController = TextEditingController();

  Completer<YandexMapController> completer = Completer<YandexMapController>();

  TextEditingController podezdController = TextEditingController();

  TextEditingController kvController = TextEditingController();

  late YandexMapController controller;
  late LocationData _currentLocation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 30.h,
        left: 15.w,
        right: 15.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Адрес доставки",
            style: Styles.styles700sp16Black,
          ),
          ScreenUtil().setVerticalSpacing(10),
          Container(
            height: 200.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ConstColor.as_salomText,
              borderRadius: BorderRadius.circular(
                10.r,
              ),
            ),
            child: Stack(
              children: [
                YandexMap(
                  onMapCreated: _onMapCreated,
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: InkWell(
                    onTap: () {
                      // Point(
                      //     latitude: _currentLocation.latitude!,
                      //     longitude: _currentLocation.longitude!);
                    },
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundColor: ConstColor.as_salomText,
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
                  controller: homeController,
                  decoration: InputDecoration(
                    hintText: "Дом",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 45.h,
                width: 150.w,
                child: TextFormField(
                  controller: etajController,
                  decoration: InputDecoration(
                    hintText: "Этаж",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
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
                  controller: podezdController,
                  decoration: InputDecoration(
                    hintText: "Подъезд",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 45.h,
                width: 150.w,
                child: TextFormField(
                  controller: kvController,
                  decoration: InputDecoration(
                    hintText: "Квартира",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ScreenUtil().setVerticalSpacing(20),
          Text(
            "comments".tr(),
            style: Styles.style400sp14Black,
          ),
          TextFormField(
            maxLines: 5,
            controller: commentController,
            decoration: InputDecoration(
              hintText: "Comments...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onMapCreated(YandexMapController controller) {
    completer.complete(controller);
  }
}
