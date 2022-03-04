part of '../home_page.dart';

class _BuildProductCard extends StatefulWidget {
  const _BuildProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  State<_BuildProductCard> createState() => _BuildProductCardState();
}

class _BuildProductCardState extends State<_BuildProductCard> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _discountPrice =
        widget.product.price! * (widget.product.discount / 100);

    return Padding(
      padding: const EdgeInsets.only(right: Const.space15),
      child: GestureDetector(
        onTap: () =>
            Get.toNamed<dynamic>(Routes.product, arguments: widget.product),
        child: Container(
            width: 170,
            decoration: BoxDecoration(
                color: _theme.backgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )),
            child: Column(
              children: [
                Container(
                  width: 170,
                  alignment: Alignment.topLeft,
                  height: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      color: _theme.backgroundColor,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: CachedNetworkImageProvider(
                          widget.product.images!.first,
                        ),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (widget.product.discount != 0)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: _theme.backgroundColor,
                              borderRadius: BorderRadius.circular(Const.radius),
                            ),
                            child: Text(
                              '${widget.product.discount}% OFF',
                              style: _theme.textTheme.headline4,
                            ),
                          )
                        else
                          const SizedBox(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              liked = !liked;
                            });
                          },
                          child: Icon(
                            Icons.favorite,
                            color: liked ? Colors.red : _theme.cardColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: 170,
                  child: Column(
                    children: [
                      //  Spacer(),
                      Container(
                        color: Colors.white,
                        height: 3,
                      ),
                      Container(
                        width: 170,
                        height: 70,
                        padding: const EdgeInsets.all(Const.space8),
                        decoration: BoxDecoration(
                          color: _theme.primaryColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                widget.product.name ?? '',
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      _theme.textTheme.bodyText2?.fontSize,
                                ),
                              ),
                            ),
                            const SizedBox(height: Const.space5),
                            if (widget.product.discount != 0)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    NumberFormat.currency(
                                      symbol: r'$',
                                      decimalDigits: 0,
                                    ).format(
                                        widget.product.price! - _discountPrice),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          _theme.textTheme.bodyText2?.fontSize,
                                    ),
                                  ),
                                  const SizedBox(width: Const.space5),
                                  Text(
                                    NumberFormat.currency(
                                      symbol: r'$',
                                      decimalDigits: 0,
                                    ).format(widget.product.price),
                                    style: TextStyle(
                                        color: _theme.backgroundColor
                                            .withOpacity(.5)),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      CartModel cart = new CartModel(
                                          productName: widget.product.name,
                                          productImage:
                                              widget.product.images!.first,
                                          price: widget.product.price,
                                          qty: 1);
                                      CartList.cartList.add(cart);
                                      print(CartList.cartList);
                                      showSnackbar(context,
                                          subtitle: '',
                                          title: AppLocalizations.of(context)!
                                              .added_to_cart);
                                    },
                                    child: Container(
                                        width: 30,
                                        height: 30,
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle),
                                        child: Icon(
                                          Icons.shopping_cart_outlined,
                                          color: _theme.primaryColor,
                                        )),
                                  ),
                                  const SizedBox(width: Const.space5),
                                ],
                              )
                            else
                              Text(
                                NumberFormat.currency(
                                  symbol: r'$',
                                  decimalDigits: 0,
                                ).format(widget.product.price),
                                style: _theme.textTheme.headline3,
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
