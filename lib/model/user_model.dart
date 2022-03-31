class UserModel {
  String? uid;
  String? email;
  String? fullName;
  // String? lastName;
  String? userName;
  String? mobileNumber;

  UserModel(
      {this.uid,
      this.email,
      this.fullName,
      // this.lastName,
      this.userName,
      this.mobileNumber});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      fullName: map['fullName'],
      // lastName: map['lastName'],
      userName: map['userName'],
      mobileNumber: map['mobileNumber'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      // 'lastName': lastName,
      'userName': userName,
      'mobileNumber': mobileNumber,
    };
  }
}
