import 'package:building_portfolio/pages/items/popular_items_details.dart';
import 'package:building_portfolio/pages/items/recommended_items_details.dart';
import 'package:building_portfolio/pages/my_home_page/main_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//the dependencies which has the init function has to be initialized in the main
import 'helper/dependencies.dart' as depend;
Future<void> main() async {
  //before you run your app, load your dependencies first
  WidgetsFlutterBinding.ensureInitialized();// To ensure that your dependencies are initialized
  await depend.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // because we are making use of the getx package to have access to the context, we have to make use of the getMateriall app instead of material app aonly
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecommendedItemDetail()//MainHomePage(),
    );
  }
}

