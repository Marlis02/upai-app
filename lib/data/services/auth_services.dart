import 'package:ctmax_upai/data/api/api.dart';
import 'package:ctmax_upai/models/account.dart';
import 'package:flutter/cupertino.dart';

class AuthServices {
  final api = Api();
  Future<dynamic> login(String username, String password) async {
    var res = await api.post('/api/upai-auth-v1/login/',
        payload: {"username": username, "password": password});
    debugPrint('SERVICE RESPONSE: $res');
    return res.data;
  }

  Future<dynamic> register(Account account) async {
    var res = await api.post('/api/upai-auth-v1/register/',
        payload: account.toRegistrationJson());
    debugPrint('SERVICE RESPONSE: $res');
    return res.data;
  }
}
