import 'package:apartey/pages/itemdetails.dart';
import 'package:apartey/theme/color_constants.dart';
import 'package:apartey/utils/data.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class ImageWidget extends StatelessWidget {
  House house;
  final imgpath_index;
  List<String> imageList;

  ImageWidget(
    this.house,
    this.imgpath_index,
    this.imageList,
  );

  @override
  Widget build(BuildContext context) {
    final oCcy = new NumberFormat("##,##,###", "en_GH");
    var screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => details(
                  this.house,
                  this.imgpath_index,
                  this.imageList,
                ),
              ),
            );
          },
          child: Container(
            height: 160,
            width: screenWidth,
            padding: const EdgeInsets.only(left: 12, right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  imageList[imgpath_index],
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: ColorConstant.kWhiteColor,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 15,
            bottom: 10,
          ),
          child: Row(
            children: <Widget>[
              Text(
                "GH₵ " + "${oCcy.format(house.amount)}",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                house.address,
                style: const TextStyle(
                  fontSize: 15,
                  color: ColorConstant.kGreyColor,
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 10,
            top: 0,
            bottom: 10,
          ),
          // child: Text(
          //   house.bedrooms.toString() +
          //       " bedrooms / " +
          //       house.bathrooms.toString() +
          //       " bathrooms / " +
          //       house.squarefoot.toString() +
          //       " ft\u00B2",
          //   style: TextStyle(
          //     fontSize: 15,
          //   ),
          // ),
        ),
      ],
    );
  }
}
