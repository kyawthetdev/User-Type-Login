import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:user_check/UsersModels.dart';

class Api {
  static List<UserModels> userLists = [];

  static getUser() async {
    http.Response response = await http.get(
        'https://raw.githubusercontent.com/kyawthetdev/users_list/master/users.json');
    //  'https://raw.githubusercontent.com/khineyinwin/User-Json/master/users.json');
    var data = json.decode(response.body)['Users'] as List;
    userLists = data.map((e) => UserModels.fromJson(e)).toList();
//    var result = userLists.firstWhere((element) => element.type == 'admin');
//    print('${result.userName}\n${result.password}');
  }
}
