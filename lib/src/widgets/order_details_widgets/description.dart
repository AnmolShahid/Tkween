import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:tkween/src/helpers/constants.dart';
import 'package:tkween/src/models/product_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    @required this.product,
  }) : super(key: key);

  final ProductModel? product;

  @override
  Widget build(BuildContext context) {

    final _theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.description,
                style: _theme.textTheme.headline3,
              ),
            ],
          ),
          ReadMoreText(
            '${product?.description}',
            style: _theme.textTheme.subtitle1,
            trimMode: TrimMode.Line,
            trimLines: 5,
            trimCollapsedText: AppLocalizations.of(context)!.read_more,
            trimExpandedText: AppLocalizations.of(context)!.show_less,
            lessStyle: _theme.textTheme.bodyText2!.copyWith(
              color: _theme.primaryColor,
            ),
            moreStyle: _theme.textTheme.bodyText2!.copyWith(
              color: _theme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
