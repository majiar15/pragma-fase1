
import 'package:fase1/presentation/modules/home/home_page.dart';
import 'package:fase1/presentation/routes/routes.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)>  get appRoutes {
  return {
    Routes.home : (_) => const HomePage(),
  };
}