import 'package:flutter/material.dart';

class menuWidget extends StatelessWidget {
  // const menuWidget({ Key? key }) : super(key: key);

  final IconData iconImg;
  final Color iconColor;
  final Function() onbtnTap;
  final Color conBackColor;

  menuWidget(
      {Key? key,
      required this.iconImg,
      required this.iconColor,
      required this.onbtnTap,
      required this.conBackColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
