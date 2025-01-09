import 'package:elevate_task/bussinessLogic_layer/product_cubit/product_cubit.dart';
import 'package:elevate_task/data_layer/api_manager/api_manager.dart';
import 'package:elevate_task/data_layer/repo/product_repo.dart';
import 'package:elevate_task/presentation_layer/home_page/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late ProductRepo productRepo;


  AppRouter(){
    productRepo=ProductRepo(apiManager: ApiManager());
  }

  Route ? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => ProductCubit(productRepo: productRepo),
              child: Home(),
            ),);
    }
  }
}