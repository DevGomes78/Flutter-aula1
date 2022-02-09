import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginApi{
  static Future<bool> login(String login,String senha) async{
    var url = Uri.parse('http://carros-springboot.herokuapp.com/api/v2/login');
    Map<String,String>headers ={
      'content-type': 'application/json'
    };

   Map params={
     'username': login,
     'password': senha,
   };
String s = json.encode(params);


    var response = await http.post(url,body: s,headers: headers );
    print('Response status : ${response.statusCode}');
    print('Response body : ${response.body}');

    return true;
  }
}