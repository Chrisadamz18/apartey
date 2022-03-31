        import 'package:flutter/material.dart';
      
        
        class welcome extends StatefulWidget {
        @override
        _welcomeState createState() => _welcomeState();
        }
        
        class _welcomeState extends State<welcome> {
        @override
        Widget build(BuildContext context) {
        // Figma Flutter Generator welcome - FRAME
        
        return Container(
      width: 414,
      height: 896,
      decoration: const BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
      color : Color.fromRGBO(255, 255, 255, 1),
  ),
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: -142,
        child: Container(
      width: 698,
      height: 920,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 40,
        left: 142,
        child: Container(
        width: 414,
        height: 870,
        decoration: const BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 1),
  )
      )
      ),
        ]
      )
    )
      ),const Positioned(
        top: 583,
        left: 144,
        child: Text('Apply as a', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Montserrat',
        fontSize: 24,
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 783,
        left: 21,
        child: Container(
      width: 0,
      height: 0,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 371,
        height: 56,
        decoration: const BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
      boxShadow : [BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
          offset: Offset(3,2),
          blurRadius: 4
      )],
      color : Color.fromRGBO(255, 255, 255, 1),
  )
      )
      ),const Positioned(
        top: 17,
        left: 134,
        child: Text('Estate Developer', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(46, 49, 146, 1),
        fontFamily: 'Montserrat',
        fontSize: 18,
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),
        ]
      )
    )
      ),Positioned(
        top: 709,
        left: 21,
        child: Container(
      width: 371,
      height: 56,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 371,
        height: 56,
        decoration: const BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
      color : Color.fromRGBO(255, 255, 255, 1),
  )
      )
      ),const Positioned(
        top: 17,
        left: 172,
        child: Text('LandLord', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(46, 49, 146, 1),
        fontFamily: 'Montserrat',
        fontSize: 18,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),
        ]
      )
    )
      ),Positioned(
        top: 635,
        left: 21,
        child: Container(
      width: 371,
      height: 56,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 371,
        height: 56,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
      color : Color.fromRGBO(255, 255, 255, 1),
  )
      )
      ),const Positioned(
        top: 17,
        left: 181,
        child: Text('Tenant', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(46, 49, 146, 1),
        fontFamily: 'Montserrat',
        fontSize: 18,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),
        ]
      )
    )
      ),Positioned(
        top: 68,
        left: 26,
        child: Container(
        width: 377,
        height: 392,
        decoration: const BoxDecoration(
          image : DecorationImage(
          image: AssetImage('assets/images/logo.png'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),const Positioned(
        top: 404,
        left: 141,
        child: Text('We’ve got youcovered', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Montserrat',
        fontSize: 18,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),
        ]
      )
    );
        }
        }
        