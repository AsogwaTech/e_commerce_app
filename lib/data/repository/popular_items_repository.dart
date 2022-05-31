// create a class based on your repository name
// remember that the main function of the repositoryis calling the api client to do something
import 'package:building_portfolio/data/api/api_client.dart';
import 'package:get/get.dart';

class PopularItemsRepo extends GetxService{
  //Repository talks to the api client via the internet and that is the reason of extending the getxservice

  final ApiClient apiClient;
  // We pass Api client to the repo so that from the repo we can call a method to get or post something to the server via the client

  // create a constructor that requires the api client which will be passed each time we call the repository
  PopularItemsRepo({required this.apiClient});
   Future<Response> getPopularItemsList() async{
     // before it return anything it needs to call the api from the api client
     return await apiClient.getData('https://www.chris.com/api/item_list');
   }
}