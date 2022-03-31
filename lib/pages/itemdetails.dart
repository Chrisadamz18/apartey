// import 'package:carousel_pro/carousel_pro.dart';

import 'package:apartey/pages/menu.dart';
import 'package:apartey/theme/color_constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';

import '/utils/data.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class details extends StatelessWidget {
  // const details({Key? key}) : super(key: key);
  House house;
  List<String> imageList;
  int imgpath_index;

  details(
    this.house,
    this.imgpath_index,
    this.imageList,
  );
  final houseArray = [];
  final typeArray = [];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    final oCcy = new NumberFormat("##,##,###", "en_GH");
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: ColorConstant.kWhiteColor),
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.only(top: 25, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(top: 0, bottom: 10),
                        child: SizedBox(
                          height: 10,
                          width: screenWidth,
                          child: CarouselSlider(
                            options: CarouselOptions(
                              height: 240,
                              enlargeCenterPage: true,
                              disableCenter: true,
                              viewportFraction: .8,
                            ),
                            items: [
                              Image.asset(imageList[imgpath_index]),
                              Image.asset(imageList[0]),
                              Image.asset(imageList[1]),
                              Image.asset(imageList[2]),
                              Image.asset(imageList[3]),
                              Image.asset(imageList[4]),
                              Image.asset(imageList[5]),

                              // ExactAssetImage(imageList[imgpath_index]),
                              // ExactAssetImage(imageList[0]),
                              // ExactAssetImage(imageList[1]),
                              // ExactAssetImage(imageList[2]),
                              // ExactAssetImage(imageList[3]),
                              // ExactAssetImage(imageList[4]),
                              // ExactAssetImage(imageList[5]),
                            ],
                            // showIndicator: true,
                            // borderRadius: false,
                            // moveIndicatorFromBottom: 180.0,
                            // noRadiusForIndicator: true,
                            // overlayShadow: false,
                            // overlayShadowColors: Colors.white,
                            // overlayShadowSize: 0.7,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          right: 15,
                          left: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            menuWidget(
                              iconImg: Icons.arrow_back,
                              iconColor: ColorConstant.kWhiteColor,
                              conBackColor: Colors.transparent,
                              onbtnTap: () {
                                Navigator.of(context).pop(false);
                              },
                            ),
                            menuWidget(
                                conBackColor: Colors.transparent,
                                iconImg: Icons.favorite_border,
                                iconColor: ColorConstant.kWhiteColor,
                                onbtnTap: () {})
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gh₵' + "${oCcy.format(house.amount)}",
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                house.address,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                            left: 15,
                          ),
                          child: Text(
                            "House Information",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          height: 110,
                          child: ListView.builder(
                            shrinkWrap: false,
                            scrollDirection: Axis.horizontal,
                            itemCount: houseArray.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: HouseWidget(
                                  type: typeArray[index],
                                  number: houseArray[index].toString(),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 20, bottom: 20),
                            child: Text(
                              'Flawless 2 story on a family friendly cul-de-sac in the heart of Blue Valley! Walk in to an open floor plan flooded w daylightm, formal dining private office, screened-in lanai w fireplace, TV hookup & custom heaters that overlooks the lit basketball court.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 15, color: Colors.blueGrey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class HouseWidget extends StatelessWidget {
  final String number;
  final String type;
  HouseWidget({
    required this.number,
    required this.type,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              18.0,
            ),
            color: ColorConstant.kWhiteColor,
            border: Border.all(color: Colors.blueGrey),
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          type,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
