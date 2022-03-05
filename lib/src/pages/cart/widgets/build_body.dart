part of '../cart_page.dart';

class _BuildBody extends StatefulWidget {
  const _BuildBody({Key? key}) : super(key: key);

  @override
  __BuildBodyState createState() => __BuildBodyState();
}

class __BuildBodyState extends State<_BuildBody> {
  var _total = 0;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    final priceList = CartList.cartList.map((cart) => cart.price);
    _total = priceList.fold<int>(0, (p, c) => p + c!);

    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.all(8),
            itemCount: CartList.cartList.length,
            separatorBuilder: (context, index) {
              return Divider(
                color: _theme.backgroundColor,
              );
            },
            itemBuilder: (context, index) {
              final cart = CartList.cartList[index];
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(color: _theme.primaryColor),
                    borderRadius: BorderRadius.circular(15)),
                child: CartCard(
                  cart: cart,
                  onRemoveTap: () {
                    showSnackbar(context,
                        subtitle: '',
                        title: AppLocalizations.of(context)!.product_removed);
                    CartList.cartList.removeAt(index);
                    setState(() {});
                  },
                ),
              );
            },
          ),
        ),
        _FooterSection(
          price: _total,
          total: total_price.toInt() + _total.toInt(),
          onCheckoutTap: () {
            Get.toNamed<dynamic>(
              Routes.checkout,
              arguments: CheckoutModel(
                products: CartList.cartList,
                // couponId: provider.selectedCoupon,
                couponId: 2,
                total: total_price + _total.toInt(),
              ),
            );
          },
        )
      ],
    );
  }
}
