import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://devphpapi.000webhostapp.com/view/Conteudo";
class API {
  static Future getUsers() async{
    var url = baseUrl + "/bebidas";

    return await http.get(url);
  }
}