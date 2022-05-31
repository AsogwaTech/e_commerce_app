
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;// token that will be used in talking to the server
  final String appBaseUrl; //url of the app use in talking to the server

  late Map<String, String> _mainHeaders; // used in storing data locally consisting of a string key and value string

   ApiClient({required this.appBaseUrl}){
     baseUrl = appBaseUrl;
     timeout = Duration(seconds: 25); // The time each of your request should try before throwing an error
     _mainHeaders = { // any time you talk to the server you need to mention the header in your url
       'Content-type' : 'application/json; charset =UTF-8',
       'Authorization': 'Bearer $token'
     };
   }

   // creating a get method. Response is used from the getx package as we are not making use of http
  // simple request of getting data from our server
   Future<Response>getData(String uri,) async{
     try{
       Response response = await get(uri);// it wait for the data and once gotten will be saved in the Response
       return response;
     }
     catch(e){
       return Response(statusCode: 1,statusText: e.toString());// the error message that will be displayed if getting the data fails
     }
   }

}