import 'dart:async';

import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:assalomproject/views/auth/components/input_widget.dart';
import 'package:assalomproject/views/confirm_order/logic/bloc/get_location_to_map_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
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

  TextEditingController homeController = TextEditingController();

  TextEditingController etajController = TextEditingController();

  TextEditingController commentController = TextEditingController();

  Completer<YandexMapController> completer = Completer<YandexMapController>();

  TextEditingController podezdController = TextEditingController();

  TextEditingController kvController = TextEditingController();

  late YandexMapController _yandexMapController;
  late Position _position;

  Map<String, dynamic> moveLocationData = {
    'title': '',
    'longitude': 69.0,
    'latitude': 41.0,
  };

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<GetLocationToMapBloc>(context);
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
                  onMapTap: (argument) {},
                  onObjectTap: (geoObject) {},
                  onUserLocationAdded: (view) {},
                  onMapCreated: (YandexMapController controller) async {
                    _position = await _getLocation();
                    _yandexMapController = controller;
                    _yandexMapController.moveCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: Point(
                            latitude: _position.latitude,
                            longitude: _position.longitude,
                          ),
                        ),
                      ),
                    );
                  },
                  onCameraPositionChanged:
                      (cameraPosition, reason, finished) async {
                    if (finished) {
                      bloc.add(
                        TryToGetLocationToMapEvent(
                          {
                            'lat': cameraPosition.target.latitude,
                            'lon': cameraPosition.target.longitude,
                          },
                        ),
                      );
                    }
                  },
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
