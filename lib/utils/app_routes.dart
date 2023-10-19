import 'package:flutter/cupertino.dart';
import 'package:to_do_app/screen/home_screen.dart';
import 'package:to_do_app/screen/splash_screen.dart';
import 'package:to_do_app/screen/to_do_screen.dart';

Map<String,WidgetBuilder> app_routes ={

  '/':(context) => SplashScreen(),
  'home':(context) => HomeScreen(),
  'todo':(context) => ToDoScreen(),
};