import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/common/enum/image_type.dart';

Widget returnImageWidget({
  required ImageType imageType,
  required String imagePath,
}) {
  Widget imageWidget;
  switch (imageType) {
    case ImageType.file:
      imageWidget = Image.file(File(imagePath), fit: BoxFit.fill);

    case ImageType.network:
      imageWidget = Image.network(imagePath, fit: BoxFit.fill);

    case ImageType.path:
      imageWidget = Image.asset(imagePath, fit: BoxFit.fill);
  }

  return imageWidget;
}
