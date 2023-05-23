import 'package:bloc_app/futures/network/utils/response.dart';
import 'package:http/http.dart' as http;

const String URL = "https://nekos.best/api/v2/hug?amount=10";

class NekoApi {
  static Future<Object> getDataNeko() async {
    try {
      final response = await http.get(Uri.parse(URL));
      print(response.statusCode);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final body = response.body;
        print(body);

        return Success(body: body, statusCode: response.statusCode);
      }
      return Failure(body: "error");
    } catch (e) {
      return Failure(body: "error");
    }
  }
}
