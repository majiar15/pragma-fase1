
import 'package:flutter/material.dart';

import '../modules/detail/detail_page.dart';
import '../modules/home/home_page.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)>  get appRoutes {
  return {
    Routes.home : (_) => const HomePage(),
    Routes.detail : (_) => const DetailPage(),
  };
}