
// this is where we load the dependencies

import 'package:building_portfolio/controllers/popular_items_controller.dart';
import 'package:building_portfolio/data/api/api_client.dart';
import 'package:building_portfolio/data/repository/popular_items_repository.dart';
import 'package:get/get.dart';

Future<void> init() async{// loading the api client first
  Get.lazyPut(() => ApiClient(appBaseUrl: 'https://www.chris.com/'));
  // After loading the api client, we then load the repository
  Get.lazyPut(() => PopularItemsRepo(apiClient: Get.find()));// getx will now find the apiclient
  Get.lazyPut(() => PopularItemsController(popularItemsRepo: Get.find()));// loading the controller
}