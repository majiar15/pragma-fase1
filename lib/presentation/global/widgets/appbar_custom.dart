import 'package:flutter/material.dart';

import '../colors/app_colors.dart';


AppBar appBarCustom({
  required BuildContext context,
  required Text title,
  List<Widget>? actions
}) {
  return AppBar(
    title: FittedBox(fit: BoxFit.contain, child: title),
    backgroundColor: AppColors.primaryColor,
    elevation: 0,
    actions: actions,
  );
}
