import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart' as l;

import 'colors.dart';

void showLoader(BuildContext context) {
  l.Loader.show(context,
      progressIndicator: Loader(
        valueColor: const AlwaysStoppedAnimation(AppColors.primaryColor),
      ).visible(true),
      overlayColor: AppColors.primaryColor.withOpacity(0.5));
}

void hideLoader() {
  l.Loader.hide();
}
