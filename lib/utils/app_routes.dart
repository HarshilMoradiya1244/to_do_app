import 'package:flutter/material.dart';
import 'package:to_do_app/screen/add/view/add_screen.dart';
import 'package:to_do_app/screen/favourite/view/favourite_screen.dart';
import 'package:to_do_app/screen/home/view/home_screen.dart';


Map<String,WidgetBuilder> app_routes = {
  '/':(context) => const HomeScreen(),
  'add':(context) => const AddScreen(),
  'favorite':(context) => const FavouriteScreen(),
};