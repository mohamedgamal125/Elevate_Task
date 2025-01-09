import 'package:elevate_task/data_layer/api_manager/api_manager.dart';
import 'package:elevate_task/presentation_layer/home_page/home.dart';
import 'package:elevate_task/utils/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'data_layer/repo/product_repo.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  final AppRouter appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430,950),
      minTextAdapt: true,
      splitScreenMode: true,

      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: false,
          //backgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
