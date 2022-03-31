import 'dart:io';
import 'package:apartey/model/user_model.dart';
import 'package:apartey/screen/login_screen.dart';
import 'package:apartey/screen/passverify.dart';
import 'package:apartey/screen/registration_screen.dart';
import 'package:apartey/screen/reset_pwd.dart';
import 'package:apartey/screen/splash.dart';
import 'package:apartey/utils/theme_helper.dart';
import 'package:apartey/widget/icon_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  // File? file;
  // ImagePicker image = ImagePicker();

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).colorScheme.secondary,
              ])),
        ),
        actions: [
          Container(
              margin: const EdgeInsets.only(
                top: 16,
                right: 16,
              ),
              child: IconBox(
                child:
                    const Icon(Icons.notifications_active, color: Colors.white),
                bgColor: Colors.redAccent[200],
                radius: 10,
                onTap: () {
                  setState(() {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ThemeHelper().alartDialog("Notification",
                            "This service is currently unavailable.", context);
                      },
                    );
                  });
                },
              )
              // Positioned(
              //   right: 0,
              //   // child: Container(
              //   //   padding: EdgeInsets.all(1),
              //   //   decoration: BoxDecoration(
              //   //     color: Colors.redAccent[700],
              //   //     borderRadius: BorderRadius.circular(6),
              //   //   ),
              //   //   constraints: const BoxConstraints(
              //   //     minWidth: 12,
              //   //     minHeight: 12,
              //   //   ),
              //   //   // child: const Text(
              //   //   //   '5',
              //   //   //   style: TextStyle(
              //   //   //     color: Colors.white,
              //   //   //     fontSize: 8,
              //   //   //   ),
              //   //   //   textAlign: TextAlign.center,
              //   //   // ),
              //   // ),
              // )

              )
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [
                0.0,
                1.0
              ],
                  colors: [
                Theme.of(context).primaryColor.withOpacity(0.2),
                Theme.of(context).accentColor.withOpacity(0.5),
              ])),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.0, 1.0],
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).accentColor,
                    ],
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Apartey",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.screen_lock_landscape_rounded,
                  size: _drawerIconSize,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                      fontSize: 17, color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SplashScreen()));
                },
              ),
              ListTile(
                leading: Icon(Icons.login_rounded,
                    size: _drawerIconSize,
                    color: Theme.of(context).accentColor),
                title: Text(
                  'Login Page',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              ListTile(
                leading: Icon(Icons.person_add_alt_1,
                    size: _drawerIconSize,
                    color: Theme.of(context).accentColor),
                title: Text(
                  'Registration Page',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationScreen()),
                  );
                },
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.password_rounded,
                  size: _drawerIconSize,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Forgot Password Page',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const resetPwd()),
                  );
                },
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.verified_user_sharp,
                  size: _drawerIconSize,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Verification Page',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ForgotPasswordVerificationPage()),
                  );
                },
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.logout_rounded,
                  size: _drawerIconSize,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  showConfirmLogout(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                // padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    // GestureDetector(
                    //   child: Container(
                    //     padding: const EdgeInsets.all(20),
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(100),
                    //       border: Border.all(width: 1, color: Colors.white),
                    //       color: Colors.white,
                    //       boxShadow: const [
                    //         BoxShadow(
                    //           color: Colors.blueGrey,
                    //           blurRadius: 3,
                    //           offset: Offset(5, 5),
                    //         ),
                    //       ],
                    //     ),
                    //     child: IconButton(
                    //         icon: Icon(Icons.person, size: 18),
                    //         color: Colors.grey.shade300,
                    //         onPressed: () {
                    //           bottomSheet();
                    //         }),
                    //   ),
                    //   onTap: () {
                    //     // bottomSheet();
                    //   },
                    // ),

                    imageProfile(),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("${loggedInUser.userName} ",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    // const Text(
                    //   'Student',
                    //   style:
                    //       TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 4.0),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "My info",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Card(
                            child: Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(15),
                              child: Column(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      ...ListTile.divideTiles(
                                        color: Colors.grey,
                                        tiles: [
                                          const ListTile(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 4),
                                            leading: Icon(Icons.my_location),
                                            title: Text("Location"),
                                            subtitle: Text("Ho-Dome"),
                                          ),
                                          ListTile(
                                            leading: Icon(Icons.email),
                                            title: Text("Email"),
                                            subtitle: Text(
                                                "${loggedInUser.email}",
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                          ),
                                          ListTile(
                                            leading: Icon(Icons.phone),
                                            title: Text("Phone"),
                                            subtitle: Text(
                                                "${loggedInUser.mobileNumber}",
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                          ),
                                          const ListTile(
                                            leading: Icon(Icons.person),
                                            title: Text("About Me"),
                                            subtitle: Text(
                                                "This is a about me link and you can khow about me in this section."),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Stack(children: [
      Column(children: <Widget>[
        // ClipOval(
        //   child: Container(
        //     width: 80.0,
        //     height: 80.0,
        //     color: Colors.blueGrey,
        //     alignment: Alignment.center,
        //     child: image != null
        //     ? Image.file(image!)
        //     : Image(image: AssetImage('assets/images/logo.png'))
        //   ),
        // ),

        Container(
          alignment: Alignment.center,
          child: CircleAvatar(
            backgroundColor: Colors.blueGrey,
            radius: 80,
            child: image != null
                ? Image.file(image!)
                : const Image(image: AssetImage('assets/images/logo.png')),
          ),
        ),
        Positioned(
          left: 70,
          right: 10.0,
          child: FlatButton.icon(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            icon: const Icon(Icons.camera_alt, color: Colors.blueGrey),
            label: const Text('Add your profile picture',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    color: Colors.blueGrey)),
          ),
        ) 
      ]),
    ]);
  }

  //  takePhoto(ImageSource source) async {
  //   var img = await image.getImage(
  //     source: source,
  //   );
  //   setState(() {
  //     file = File(img!.path);
  //   });
  // }

  Widget bottomSheet() {
    return Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: <Widget>[
            const Text(
              'Choose your profile picture',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.camera),
                  onPressed: () {
                    // takePhoto(ImageSource.camera);
                    pickImageC();
                  },
                  label: const Text('Camera'),
                ),
                FlatButton.icon(
                  icon: Icon(Icons.image),
                  onPressed: () {
                    // takePhoto(ImageSource.gallery);
                    pickImage();
                  },
                  label: const Text('Gallery'),
                ),
              ],
            )
          ],
        ));
  }

// the logout function
  Future<void> showConfirmLogout(BuildContext context) async {
    showCupertinoModalPopup(
      context: context,
      builder: (Context) => CupertinoActionSheet(
        message: const Text("Would you like to log out of your account?",
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            )),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: const Text(
              "Log out",
              style: TextStyle(
                color: Colors.cyan,
              ),
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
      ),
    );
  }
}
