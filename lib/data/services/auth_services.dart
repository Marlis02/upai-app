import 'package:ctmax_upai/data/api/api.dart';
import 'package:flutter/cupertino.dart';

class AuthServices {
  final api = Api();
  Future<dynamic> login() async {
    var res = await api.post('/api/upai-auth-v1/login/',
        payload: {"username": "qwerty", "password": "qwerty529156"});
    debugPrint('SERVICE RESPONSE: ${res}');
    return res.data;
  }
}
