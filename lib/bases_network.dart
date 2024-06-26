import 'dart:convert';
import 'package:http/http.dart' as http;

class baseNetwork{
  static final String baseUrl = "https://reqres.in/api";

  static Future<Map<String, dynamic>> get(String partUrl) async{
    final String fullUrl = baseUrl + "/" + partUrl;
    debugPrint("BaseNetwork - fullUrl: $fullUrl");
    final response = await http.get(Uri.parse(fullUrl));
    debugPrint("BaseNetwork - response: ${response.body}");
    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> _processResponse(
      http.Response response
      ) async{
        final body = response.body;
        if(body.isEmpty){
          print("processResponse error");
          return{"error": true};
        }
        final jsonBody = json.decode(body);
        return jsonBody;

  }

  static void debugPrint(String value){
    print("[BASE_NETWORK] - $value");
    }
}