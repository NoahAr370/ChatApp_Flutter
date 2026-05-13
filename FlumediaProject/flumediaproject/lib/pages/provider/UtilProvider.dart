//import 'dart:convert';

import 'dart:convert';

import 'package:flumediaproject/utils/Routes.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Utilprovider extends ChangeNotifier {
  String local_app_version = "1.0.1";
  bool _isLoading = false;
  bool _showtitle = false;
  String _error = "";
  String get error => _error;
  bool get isLoading => _isLoading;
  bool get showTitle => _showtitle;

  Future<bool> checkAppVersion() async {
    _isLoading = true;
    bool isSameVersion = false;
    notifyListeners();

    String url = "$API_URL/version/${local_app_version}";
    //print(url);
    try {
      //print("Hello");
      final response = await http.get(Uri.parse(url));
      //print("Hello 101");
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        bool con = data["con"];
        if (con) {
          isSameVersion = true;
          _showtitle = true;
        } else {
          _error = data["msg"];
        }
        // String server_app_version = data["msg"] ?? "0000";
        // if (local_app_version == server_app_version) {
        //   // isSameVersion = true;
        //   // _showtitle = true;
        // } else {
        //   _error = "Version outdated! Please download new Version";
        // }
        //print(server_app_version);
        //print("Response Data" + response.body.toString());
      } else {
        _error = "Request Error!";
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
    return isSameVersion;
  }
}
