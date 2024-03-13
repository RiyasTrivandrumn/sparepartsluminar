import 'package:spare_parts/global/shared_preferences.dart';
import 'package:spare_parts/presentation/views/spareList/Model/list_model.dart';
import 'package:http/http.dart' as http;

class ListService {
  static Future<List<ListModel>> fetchlist() async {
    var jwtToken = await SharedPrefs.getTokenfromSF();
    print(jwtToken);

    var headers = {
      'Authorization': 'Bearer $jwtToken',
      'Content-Type': 'application/json',
    };

    var response = await http.get(Uri.parse("http://10.0.2.2:8000/items/"),
        headers: headers);

    if (response.statusCode == 200) {
      var responsebody = response.body;
      print(responsebody);

      return listModelFromJson(responsebody);
    } else {
      throw Exception(response.body);
    }
  }
}
