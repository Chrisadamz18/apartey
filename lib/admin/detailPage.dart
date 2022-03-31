import 'package:flutter/material.dart';

class detailPage extends StatelessWidget {
  final data;
  detailPage(this.data);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            SizedBox(height: 15.0),
            Container(
              child: Image.network(data['image']),
            ),
            SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(data['type'],
                    style: const TextStyle(
                      fontSize: 23.0,
                      color: Colors.blueGrey,
                      fontFamily: 'Montserrat'
                    )),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(data['description'],
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Montserrat')))
          ],
        )
      ]),
    );
  }
}
