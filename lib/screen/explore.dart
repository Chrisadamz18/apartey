import 'package:apartey/screen/splash.dart';
import 'package:apartey/utils/theme_helper.dart';
import 'package:apartey/widget/custom_textbox.dart';
import 'package:apartey/widget/icon_box.dart';
import 'package:apartey/widget/recommend_item.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '/theme/color.dart';
import '/utils/data.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
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
    return Row(
      children: [
        Expanded(
            child: CustomTextBox(
          hint: "Search",
          prefix: const Icon(Icons.search, color: Colors.grey),
        )),
        const SizedBox(
          width: 10,
        ),
        IconBox(
            child: const Icon(Icons.filter_list_rounded, color: Colors.white),
            bgColor: Colors.blue,
            radius: 10,
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ThemeHelper().alartDialog("Oops",
                      "This service is currently unavailable.", context);
                },
              );
            })
      ],
    );
  }

  getBody() {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 20,
      ),
      Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: const Text(
          "Matched Properties",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      listRecommended(),
      const SizedBox(
        height: 20,
      ),
      // Container(
      //   margin: const EdgeInsets.only(left: 15, right: 15),
      //   child: const Text(
      //     "Companies",
      //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      //   ),
      // ),
      const SizedBox(
        height: 20,
      ),
      // listCompanies(),
      const SizedBox(
        height: 20,
      ),
      // listBrokers(),
      const SizedBox(
        height: 100,
      ),
    ]));
  }

  listRecommended() {
    List<Widget> lists = List.generate(
      recommended.length,
      (index) => RecommendItem(
        data: recommended[index],
        onTap: () {
          Navigator.pushAndRemoveUntil(
              (context),
              MaterialPageRoute(builder: (context) => SplashScreen()),
              (route) => false);
          setState(() {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return ThemeHelper()
                    .alartDialog("Oops", "Error occured.", context);
              },
            );
          });
          // Fluttertoast.showToast(msg: 'clicked');
        },
      ),
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

  int selectedCategory = 0;
  // listCompanies() {
  //   List<Widget> lists = List.generate(
  //       companies.length,
  //       (index) => CompanyItem(
  //             data: companies[index],
  //             color: listColors[index % 10],
  //             selected: index == selectedCategory,
  //             onTap: () {
  //               setState(() {
  //                 selectedCategory = index;
  //               });
  //             },
  //           ));

  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     padding: EdgeInsets.only(bottom: 5, left: 15),
  //     child: Row(children: lists),
  //   );
  // }

  // listBrokers(){
  //   List<Widget> lists = List.generate(brokers.length,
  //     (index) => BrokerItem(data: brokers[index])
  //   );

  //   return
  //     Container(
  //       margin: EdgeInsets.only(right: 15, left: 15),
  //       child: Column(
  //         children: lists
  //       ),
  //     );
  // }
}
