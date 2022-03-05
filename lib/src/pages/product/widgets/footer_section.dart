part of '../product_page.dart';

class _FooterSection extends StatelessWidget {
  const _FooterSection({
    Key? key,
    required this.product,
    this.qty,
    this.total,
    this.onAddTap,
    this.onRemoveTap,
    this.onAddToCartTap,
  }) : super(key: key);

  final ProductModel product;
  final int? qty;
  final int? total;
  final VoidCallback? onAddTap;
  final VoidCallback? onRemoveTap;
  final VoidCallback? onAddToCartTap;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Container(
      width: Screens.width(context),
      height: 130,
      alignment: Alignment.bottomCenter,
      color: _theme.backgroundColor,
      padding: const EdgeInsets.fromLTRB(
        Const.margin,
        Const.space12,
        Const.margin,
        Const.margin,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.qty,
                    style: _theme.textTheme.subtitle1!.copyWith(fontSize: 16),
                  ),
                  const SizedBox(width: Const.space8),
                  InkWell(
                    onTap: onRemoveTap,
                    borderRadius: BorderRadius.circular(25),
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: _theme.primaryColor,
                      child: const Icon(
                        Icons.remove,
                        color: Colors.black,
                        size: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: Const.space8),
                  Text(
                    qty.toString(),
                    style: _theme.textTheme.bodyText2!.copyWith(fontSize: 16),
                  ),
                  const SizedBox(width: Const.space8),
                  InkWell(
                    onTap: onAddTap,
                    borderRadius: BorderRadius.circular(25),
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: _theme.primaryColor,
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: Const.space8),
                ],
              ),
              Row(
                children: [
                  AutoSizeText(
                    AppLocalizations.of(context)!.total,
                    style: _theme.textTheme.subtitle1!.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: Const.space8),
                  AutoSizeText(
                    NumberFormat.currency(
                      symbol: r'$',
                    ).format(total),
                    style: _theme.textTheme.headline3,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: Const.space25),
          Row(
            children: [
              Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.black26,
                      )),
                  child: const Icon(FeatherIcons.shoppingCart)),
              const SizedBox(width: Const.space15),
              CustomElevatedButton(
                width: 270,
                onTap: onAddToCartTap,
                child: AutoSizeText(
                  AppLocalizations.of(context)!.add_to_cart,
                  style: _theme.textTheme.button,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
