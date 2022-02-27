import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import 'package:tkween/src/helpers/constants.dart';
import 'package:tkween/src/models/cart_model.dart';
import 'package:tkween/src/widgets/custom_network_image.dart';

class CartCard extends StatefulWidget {
   CartModel cart;
  final VoidCallback? onRemoveTap;

   CartCard({Key? key, required this.cart, this.onRemoveTap})
      : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color _colorType(int val) {
      switch (val) {
        case 0:
          return const Color(0xFF6D9BE1);
        case 1:
          return const Color(0xFFBF5E5A);
        case 2:
          return const Color(0xFFA1ABBD);
        case 3:
          return const Color(0xFF699156);
        case 4:
          return const Color(0xFFC58F5E);
        case 5:
          return const Color(0xFFA872B1);
        default:
          return const Color(0xFFFFFFFF);
      }
    }

    String _sizeType(int val) {
      switch (val) {
        case 0:
          return 'M';
        case 1:
          return 'L';
        case 2:
          return 'XL';
        default:
          return 'M';
      }
    }

    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      secondaryActions: [
        IconSlideAction(
          icon: FeatherIcons.trash,
          color: Colors.red,
          onTap: widget.onRemoveTap,
        ),
      ],
      child: Container(
        height: 130,

        decoration: BoxDecoration(
            color: theme.backgroundColor,
            border: Border.all(color: theme.primaryColor),
            borderRadius: BorderRadius.circular(15)
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: Const.margin,
          vertical: Const.space12,
        ),
        child: Row(
          children: [
            CustomNetworkImage(
              image: widget.cart.productImage!,
              width: 120,
              height: 120,
              fit: BoxFit.contain,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Const.space12,
                  vertical: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      widget.cart.productName!,
                      style: theme.textTheme.headline3,
                      maxLines: 1,
                    ),
                    const SizedBox(height: Const.space8),
                    Row(
                      children: [
                        // AutoSizeText(
                        //   AppLocalizations.of(context)!.color,
                        //   style: theme.textTheme.subtitle2,
                        //   maxLines: 1,
                        // ),
                        // const SizedBox(width: 5),
                        // CircleAvatar(
                        //   radius: 8,
                        //   backgroundColor: _colorType(cart.color!),
                        // ),
                        // const SizedBox(width: Const.space8),
                        // AutoSizeText(
                        //   AppLocalizations.of(context)!.size,
                        //   style: theme.textTheme.subtitle2,
                        //   maxLines: 1,
                        // ),
                        // const SizedBox(width: 5),
                        AutoSizeText('qty',
                          style: theme.textTheme.headline4,
                          maxLines: 1,
                        ),
                        const SizedBox(width: Const.space8),

                        InkWell(
                          onTap:() {
                            if(!widget.cart.productName!.contains('همسات ريفية'))
                              setState(() => widget.cart.qty = max(1, widget.cart.qty! + 1));

                          },
                          borderRadius: BorderRadius.circular(25),
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: theme.primaryColor,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                        
                        const SizedBox(width: Const.space8),

                        Text(
                          widget.cart.qty.toString(),
                          style: theme.textTheme.bodyText2!.copyWith(fontSize: 16),
                        ),
                        const SizedBox(width: Const.space8),
                        InkWell(
                          onTap: (){
                            if (widget.cart.qty != 1) {
                              setState(() {
                                widget.cart.qty = min(50, widget.cart.qty! - 1);
                              });

                            }
                          },
                          borderRadius: BorderRadius.circular(25),
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: theme.primaryColor,
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: Const.space8),
                    AutoSizeText(
                      NumberFormat.currency(
                        symbol: r'$',
                      ).format(widget.cart.price),
                      style: theme.textTheme.headline4,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
