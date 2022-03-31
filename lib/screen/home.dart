import 'package:apartey/pages/constants.dart';
import 'package:apartey/pages/imagewidget.dart';
import 'package:apartey/screen/splash.dart';
import 'package:apartey/utils/theme_helper.dart';
import 'package:apartey/widget/category_item.dart';
import 'package:apartey/widget/custom_textbox.dart';
import 'package:apartey/widget/icon_box.dart';
import 'package:apartey/widget/property_item.dart';
import 'package:apartey/widget/recent_item.dart';
import 'package:apartey/widget/recommend_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '/theme/color.dart';
import '/utils/data.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: appBgColor,
          pinned: true,
          snap: true,
          floating: true,
          title: getHeader(),
        ),
        SliverToBoxAdapter(child: getBody())
      ],
    );
  }

  getHeader() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Location",
                      style: TextStyle(
                          color: darker,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Ho, Volta Region",
                      style: TextStyle(
                          color: Colors.red[600],
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                // CustomImage(
                //   profile,
                //   width: 35,
                //   height: 35,
                //   trBackground: true,
                //   borderColor: primary,
                //   radius: 10,
                // ),
                SizedBox(width: 50),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(8.0),
                            backgroundColor: Color(0xFFff4b60),
                          ),
                          child: const Text('Create a Post',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            setState(() {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ThemeHelper().alartDialog(
                                      "Create a Post",
                                      "This service is currently unavailable.",
                                      context);
                                },
                              );
                            });
                          }),
                    ],
                  ),
                ), //clip

                const SizedBox(width: 6),
                IconBox(
                  child: const Icon(Icons.notifications_active,
                      color: Colors.white),
                  bgColor: const Color(0xFFff4b60),
                  radius: 10,
                  onTap: () {
                    setState(() {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ThemeHelper().alartDialog(
                              "Notification",
                              "This service is currently unavailable.",
                              context);
                        },
                      );
                    });
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextBox(
                    hint: "Search",
                    prefix: const Icon(Icons.search, color: Colors.blue),
                    // onPressed: (){},
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                // TextButton(
                //     style: TextButton.styleFrom(
                //       backgroundColor: Color(0xFF2ecc71),
                //     ),
                //     child: Text('Create a Post',
                //         style: TextStyle(color: Colors.white)),
                //     onPressed: () {}),
                const SizedBox(width: 6),
                IconBox(
                  child: const Icon(Icons.filter_list_rounded,
                      color: Colors.white),
                  bgColor: Colors.blue,
                  radius: 10,
                  onTap: () {
                    setState(() {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ThemeHelper().alartDialog(
                              "Oops",
                              "This service is currently unavailable.",
                              context);
                        },
                      );
                    });
                  },
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 0),
            child: listCategories(),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Popular",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins'),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                      fontSize: 14, color: darker, fontFamily: 'Poppins'),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          listPopulars(),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Recommended",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins'),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                      fontSize: 14, color: darker, fontFamily: 'Poppins'),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          listRecommended(),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Recent",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                      fontSize: 14, color: darker, fontFamily: 'Poppins'),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          listRecent(),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  int selectedCategory = 0;
  listCategories() {
    List<Widget> lists = List.generate(
        categories.length,
        (index) => CategoryItem(
              data: categories[index],
              selected: index == selectedCategory,
              onTap: () {
                setState(() {
                  selectedCategory = index;
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ThemeHelper().alartDialog("Oops",
                          "This service is currently unavailable.", context);
                    },
                  );
                });
              },
            ));
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

  listPopulars() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 240,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .8,
      ),
      items: List.generate(
        populars.length,
        (index) => PropertyItem(data: populars[index]),

        //  ImageWidget(
        //    Constants.houseList[index],Constants.imageList,
        //  )
      ),
    );
  }

  listRecommended() {
    List<Widget> lists = List.generate(
        recommended.length,
        (index) => RecommendItem(
              data: recommended[index],
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SplashScreen()),
                );

                setState(() {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ThemeHelper().alartDialog("Oops",
                          "This service is currently unavailable.", context);
                    },
                  );
                });
              },
            ));

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

  listRecent() {
    List<Widget> lists = List.generate(
        recents.length,
        (index) => RecentItem(
              data: recents[index],
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => ImageWidget(
                        Constants.houseList[index], index, Constants.imageList),
                  ),
                );
              },
            ));

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }
}
