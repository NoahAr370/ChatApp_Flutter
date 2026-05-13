import 'dart:convert';

import 'package:flumediaproject/models/User.dart';
import 'package:flumediaproject/utils/Routes.dart';
import 'package:flumediaproject/utils/Vary.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Userprovider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isHidePass = true;
  String _name = "";
  String _displayName = "";
  String _phone = "";
  String _password = "";
  String _error = "";
  String token = "";
  late User _user;

  bool get isHidePass => _isHidePass;
  String get name => _name;
  String get displayName => _displayName;
  String get phone => _phone;
  String get password => _password;
  bool get isLoading => _isLoading;
  String get error => _error;
  User get user => _user;

  Future<bool> getMe() async {
    Uri uri = Uri.parse("$API_URL/me");
    try {
      final response = await http.get(uri, headers: Vary.header);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        var userStr = data["result"]; //print(userStr);
        _user = User.fromJson(userStr);
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    } finally {
      notifyListeners();
    }
    return true;
  }

  Future<bool> login() async {
    bool isSuccess = false;
    _isLoading = true;
    notifyListeners();

    var json = jsonEncode({
      "name": _name,
      "password": _password,
    });
    // print(json);
    Uri uri = Uri.parse("$API_URL/login");
    try {
      final response = await http.post(uri, body: json, headers: Vary.header);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        //print(data);
        token = data["result"];
        //print(token);
        Vary.token = data["result"];
        _isLoading = false;
        isSuccess = true;
        Vary.header = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };
        await getMe();
        notifyListeners();
      } else {
        // _error = "Register Fail!";
        final data = jsonDecode(response.body);
        _error = data["msg"];
        print(data["msg"]);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      notifyListeners();
    }
    return isSuccess;
  }

/////////////////////////////////////////////////////////////////////
  Future<bool> register() async {
    bool isSuccess = false;
    _isLoading = true;
    notifyListeners();

    var json = jsonEncode({
      "name": _name,
      "displayName": _displayName,
      "phone": _phone,
      "password": _password,
    });
    // print(json);
    Uri uri = Uri.parse("$API_URL/register");
    try {
      final response = await http.post(uri, body: json, headers: Vary.header);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        _isLoading = false;
        isSuccess = true;
        notifyListeners();
      } else {
        // _error = "Register Fail!";
        final data = jsonDecode(response.body);
        _error = data["msg"];
        print(data["msg"]);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      notifyListeners();
    }
    return isSuccess;
  }

  Future<bool> editName() async {
    bool isSuccess = false;
    _isLoading = true;
    notifyListeners();

    var json = jsonEncode({
      "name": name,
    });
    Uri uri = Uri.parse("$USER_URL/changeName");

    try {
      final response = await http.post(uri, body: json, headers: Vary.header);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data.toString());
        isSuccess = true;
        await getMe();
        notifyListeners();
      } else {
        final data = jsonDecode(response.body);
        _error = data["msg"] ?? "Name Change Fail";
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }

    return isSuccess;
  }

  nameChange(name) {
    _name = name;
    notifyListeners();
  }

  displayNameChange(displayName) {
    _displayName = displayName;
    notifyListeners();
  }

  phoneChange(phone) {
    _phone = phone;
    notifyListeners();
  }

  passwordChange(password) {
    _password = password;
    notifyListeners();
  }

  toggleShow() {
    _isHidePass = !_isHidePass;
    notifyListeners();
  }
}
