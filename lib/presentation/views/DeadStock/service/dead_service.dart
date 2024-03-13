import 'package:http/http.dart' as http;
import 'package:spare_parts/global/shared_preferences.dart';
import 'package:spare_parts/presentation/views/DeadStock/model/deadmodel.dart';
import 'package:spare_parts/utils/apputils.dart';

class DeadService {
  static Future<List<DeadModel>> fetchdead() async {
    var jwtToken = await SharedPrefs.getTokenfromSF();
    print(jwtToken);

    var headers = {
      'Authorization': 'Bearer $jwtToken',
      'Content-Type': 'application/json',
    };

    var response = await http.get(Uri.parse(AppUtils.baseUrl+"/deadstock_items/"),
        headers: headers);

    if (response.statusCode == 200) {
      var responsebody = response.body;
      print(responsebody);

      return deadModelFromJson(responsebody);
    } else {
      throw Exception(response.body);
    }
  }
}
