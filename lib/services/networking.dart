import 'package:http/http.dart' as http;
import 'dart:convert';


class NetworkHelper
{
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      // get the coords
      var decodedData = jsonDecode(data);
      return decodedData;
  } else {
      print(response.statusCode);
    }
}
}