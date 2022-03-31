import 'package:apartey/admin/detailPage.dart';
import 'package:apartey/model/apartment.dart';
import 'package:apartey/theme/color.dart';
import 'package:apartey/utils/theme_helper.dart';
import 'package:apartey/widget/icon_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  final CollectionReference firebase =
      FirebaseFirestore.instance.collection('apartment');

  // ApartmentModel apartment = ApartmentModel();

  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseFirestore.instance
  //       .collection("apartment")
  //       .doc()
  //       .get()
  //       .then((value) {
  //     // ApartmentModel.fromMap(value.data());
  //     this.apartment = ApartmentModel.fromMap(value.data());
  //     setState(() {});
  //   });
  // }

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
                          color: Colors.blueGrey,
                          fontSize: 16,
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
                const SizedBox(width: 50),
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
                            backgroundColor: const Color(0xFFff4b60),
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

  getBody() {}

  // getBody() {
  //   return Scaffold(
  //       body: StreamBuilder(
  //     stream: firebase.snapshots(),
  //     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //       if (!snapshot.hasData) {
  //         return const Center(
  //           child: CircularProgressIndicator(color: Colors.blueGrey),
  //         );
  //       }
  //       return ListView(
  //           children: snapshot.data!.docs.map((document) {
  //         return GestureDetector(onTap: () {
  //           Navigator.push(context,
  //               MaterialPageRoute(builder: (context) => detailPage(document)));
  //         },
  //         child:Card(child:ListTile(
  //           title: Text(document['type'])
  //         ))
  //         );
  //       }));
  //     },
  //   ));
  // }
}
