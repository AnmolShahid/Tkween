import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tkween/src/helpers/constants.dart';
import 'package:tkween/src/models/category_model.dart';

class CategoryList {
  static List<CategoryModel> categoryList(BuildContext context) => [
        CategoryModel(
          name: 'E-Book',
          icon: CustomIcon.ebook,
        ),
        CategoryModel(
          name: 'Book',
          icon: CustomIcon.book,
        ),
      ];

  static List<CategoryModel> categoryListTwo(BuildContext context) => [
    CategoryModel(
      name: 'Islamic',
      icon: CustomIcon.book,
    ),
    CategoryModel(
      name: 'History',
      icon: CustomIcon.book,
    ),
    CategoryModel(
      name: 'Fiction',
      icon: CustomIcon.book,
    ),

  ];
}
