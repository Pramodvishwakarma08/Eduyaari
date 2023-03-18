import 'package:eduyaari02/models/home_model.dart';
import 'package:http/http.dart' as http;

import '../const.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<HomeModel?> fetchProducts() async {
    var response = await client.post(Uri.parse(AppUrl.home_elements),
        body: {"app_hash": apphashcode});
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return HomeModel.fromJson(jsonString as Map<String, dynamic>);
    } else {
      //show error message
      return null;
    }
  }
}