import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Model/apimodel.dart';

class Api_Helper {
  Api_Helper._();

  static Api_Helper api = Api_Helper._();

  Future<List<News_Model>?> News({required String search}) async {
    String searchData = search;
    String api =
        "http://api.mediastack.com/v1/news?access_key=94c5cf2364264dfb5cd87854273682a1&keywords=$searchData&countries=us";
    http.Response response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      Map decodedData = jsonDecode(response.body);
      List list1 = decodedData['data'];
      List<News_Model> Data = list1
          .map(
            (e) => News_Model.fromJSON(data: e),
          )
          .toList();

      return Data;
    } else {
      return null;
    }
  }
}
