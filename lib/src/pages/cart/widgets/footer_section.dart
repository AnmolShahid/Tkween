part of '../cart_page.dart';

class _FooterSection extends StatelessWidget {
  final int? total;
  final VoidCallback? onCheckoutTap;
  final int? price;
  const _FooterSection({
    Key? key,
    this.total,
    this.price,
    this.onCheckoutTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<CartProvider>(builder: (context, cart, snapshot) {
      return Container(
        width: Screens.width(context),
        height: 200,
        color: theme.cardColor,
        padding: const EdgeInsets.symmetric(
          horizontal: Const.margin,
          vertical: Const.space8,
        ),
        child: Column(
          children: [
            InkWell(
              onTap: () => Get.toNamed<dynamic>(Routes.selectCoupon),
              borderRadius: BorderRadius.circular(Const.radius),
              child: Container(
                width: Screens.width(context),
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(color: theme.hintColor),
                  borderRadius: BorderRadius.circular(Const.radius),
                ),
                padding: const EdgeInsets.symmetric(horizontal: Const.space15),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      CustomIcon.coupon,
                      color: theme.hintColor,
                    ),
                    const SizedBox(width: Const.space12),
                    AutoSizeText(
                      (cart.selectedCoupon != null)
                          ? '${CouponList.couponList[cart.selectedCoupon!].name!} ${CouponList.couponList[cart.selectedCoupon!].discount}% OFF'
                          : AppLocalizations.of(context)!.enter_your_promo_code,
                      style: theme.textTheme.subtitle2,
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: theme.hintColor,
                      size: 12,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: Const.space12),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    AppLocalizations.of(context)!.total,
                    style: theme.textTheme.bodyText1,
                  ),
                  AutoSizeText(
                    NumberFormat.currency(
                      symbol: r'$',
                    ).format(total),
                    style: theme.textTheme.headline3,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextButton(
                  onPressed: () {
                    Get.offAllNamed<dynamic>(Routes.cart);
                  },
                  child: Text('Update')),
            ),
            const SizedBox(height: Const.space5),
            CustomElevatedButton(
              onTap: onCheckoutTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    FeatherIcons.shoppingBag,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(width: Const.space12),
                  AutoSizeText(
                    AppLocalizations.of(context)!.checkout,
                    style: theme.textTheme.button,
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
