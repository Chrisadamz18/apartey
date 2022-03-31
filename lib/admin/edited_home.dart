import 'package:apartey/model/apartment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class mainHome extends StatefulWidget {
  const mainHome({Key? key}) : super(key: key);

  @override
  State<mainHome> createState() => _mainHomeState();
}

class _mainHomeState extends State<mainHome> {
  // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  // ApartmentModel apartmentList = ApartmentModel();
  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseFirestore.instance
  //       .collection('apartment')
  //       .doc()
  //       .get()
  //       .then((value) {
  //     apartmentList = ApartmentModel.fromMap(value.data());
  //     setState(() {

  //     });
  //   });
  // }
  final CollectionReference _apartments =
      FirebaseFirestore.instance.collection('apartment');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: _apartments.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.hasData) {
          return ListView.builder(
            itemCount: streamSnapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              final DocumentSnapshot documentSnapshot =
                  streamSnapshot.data!.docs[index];

              return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(title: Text(documentSnapshot['type'])));
            },
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    )

        // Center(
        //   child: Text(
        //     "${apartmentList.type}",
        //     style: const TextStyle(
        //       fontSize: 18,
        //       fontFamily: 'Montserrat',
        //       fontWeight: FontWeight.bold,
        //       color: Color.fromARGB(255, 1, 25, 37),
        //     ),
        //   ),
        // ),
        );
  }
}
