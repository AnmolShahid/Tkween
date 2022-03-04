import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:octo_image/octo_image.dart';
import 'package:tkween/src/helpers/constants.dart';
import 'package:tkween/src/helpers/snack_toast.dart';
import 'package:tkween/src/list_data/cart_list.dart';
import 'package:tkween/src/models/cart_model.dart';
import 'package:tkween/src/models/product_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _discountPrice =
        widget.product.price! * (widget.product.discount / 100);

    return GestureDetector(
      onTap: () =>
          Get.toNamed<dynamic>(Routes.product, arguments: widget.product),
      child: Container(
        decoration: BoxDecoration(
          color: _theme.backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 0),
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
                                  borderRadius:
                                      BorderRadius.circular(Const.radius),
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
                                        ).format(widget.product.price! -
                                            _discountPrice),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: _theme
                                              .textTheme.bodyText2?.fontSize,
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
                                          showSnackbar(context,
                                              subtitle: '',
                                              title:
                                                  AppLocalizations.of(context)!
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
        ),

        /*    Container(
          width: 150,
          height: 250,
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
              )
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
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
                    Icon(
                      Icons.favorite,
                      color: _theme.disabledColor,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                color: Colors.white,
                height:3,),
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
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: _theme.textTheme.bodyText2?.fontSize,
                        ),

                      ),
                    ),
                    const SizedBox(height: Const.space8),
                    if (widget.product.discount != 0)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            NumberFormat.currency(
                              symbol: r'$',
                              decimalDigits: 0,
                            ).format(widget.product.price! - _discountPrice),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: _theme.textTheme.bodyText2?.fontSize,
                            ),
                          ),
                          const SizedBox(width: Const.space5),
                          Text(
                            NumberFormat.currency(
                              symbol: r'$',
                              decimalDigits: 0,
                            ).format(widget.product.price),
                            style: _theme.textTheme.subtitle2?.copyWith(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          Spacer(),
                          Container(
                              width: 30,
                              height: 30,
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle
                              ),
                              child: Icon(Icons.shopping_cart_outlined,color: _theme.primaryColor,)),
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
        ),
   */
      ),
    );
  }
}
