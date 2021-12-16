import 'package:apihttp/viewa/homepage.dart';
import 'package:apihttp/viewa/nextscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        /* initialRoute: '/',*/
        routes: {
          'homepage': (context) => HomePage(),
          '/nextscreen': (context) => NextScreen(),
        },
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
    });
  }
}
