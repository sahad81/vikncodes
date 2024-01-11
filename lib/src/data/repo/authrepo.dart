
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vikn_codes_machin_test/util/app_constants.dart';

class AuthRepo {

static Future<Response  >  login(String id,password)async{



try {
    http.Response  _response = await http.post(
        Uri.parse(AppConstants.loginUrl),
        body: {
          "username":id,
          "password":password
        },
       
      ).timeout(Duration(seconds: 14));
    
     
        print(_response);
        return Response(body: _response.body,statusCode: _response.statusCode );
      
      
 
} catch (e) {
return  Response(statusCode: 1);
}


}

}