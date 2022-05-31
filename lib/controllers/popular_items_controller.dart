/*here we make use of getxcontroller. Controller function is
 to det the return function from the repository and pass it to the ui for rebuilding */

import 'package:get/get.dart';

import '../data/repository/popular_items_repository.dart';

class PopularItemsController extends GetxController{
  final PopularItemsRepo popularItemsRepo;
  // remember that before you initialize a repo, you have to pass the api client
  PopularItemsController({required this.popularItemsRepo});
  List<dynamic> _popularItemList = [];// this is where the data being returned by the repo is being kept
  List<dynamic> get popularItemList => _popularItemList;// in order to get access to the list anywhere in your page
   Future<void> getPopularItemsList()async{
     Response response = await popularItemsRepo.getPopularItemsList();// this will call the repo, the repo then call the api client
     if(response.statusCode == 200){
       _popularItemList = [];// to avoid repetition of data, first initialize it to null
       //to ensure that the data we got from the server are displayed on the ui, we need to create a model
      // _popularItemList.addAll();
       /* here we need to create a model, this is because, our response data
        is in json format which will need to be converted to a model*/
       update();
     }
     else {}
   }
}