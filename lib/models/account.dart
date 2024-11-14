import 'package:ctmax_upai/utils/utils.dart';

import 'common.dart';

class Account {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? password2;
  String? imageUrl;
  bool? activated;
  String? langKey;
  String? createdBy;
  DateTime? createdDate;
  String? lastModifiedBy;
  DateTime? lastModifiedDate;
  int? otpCounter;
  String? otpSecret;
  List<String>? authorities;

  Account({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.password2,
    this.imageUrl,
    this.activated,
    this.langKey,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.authorities,
    this.otpCounter,
    this.otpSecret,
  });

  factory Account.fromJson(DataParam json) {
    return Account(
      id: json['id'],
      username: json['login'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      password2: json['password2'],
      imageUrl: json['imageUrl'],
      activated: json['activated'],
      langKey: json['langKey'],
      createdBy: json['createdBy'],
      createdDate: parseDate(json['createdDate']),
      lastModifiedBy: json['lastModifiedBy'],
      otpCounter: json['otpCounter'],
      otpSecret: json['otpSecret'],
      lastModifiedDate: parseDate(json['lastModifiedDate']),
      authorities: (json['authorities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
  }

  DataParam toJson() {
    return ({
      'id': id,
      'login': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'password2': password2,
      'imageUrl': imageUrl,
      'activated': activated,
      'langKey': langKey,
      'createdBy': createdBy,
      'createdDate': createdDate?.toIso8601String(),
      'lastModifiedBy': lastModifiedBy,
      'lastModifiedDate': lastModifiedDate?.toIso8601String(),
      'authorities': authorities,
      'otpSecret': otpSecret,
      'otpCounter': otpCounter,
    });
  }

  Map<String, dynamic> toRegistrationJson() {
    return {
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'password2': password2,
    };
  }

  @override
  String toString() {
    return '$username - $email';
  }
}
