import 'package:flutter/material.dart';
import 'package:tkween/src/models/product_model.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key? key,
    this.product,
  }) : super(key: key);

  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 200,
            width: double.maxFinite,
            alignment: Alignment.topRight,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(60),
                    bottomLeft: Radius.circular(60))),
            child: Column(
              children: [
                Text(
                  "${product?.name}",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline3!.fontSize,
                      color: Theme.of(context).primaryColor),
                ),
                SizedBox(height: 78),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Price\n",
                          style: TextStyle(color: Theme.of(context).primaryColor)),
                      TextSpan(
                          text: "\$${product?.price}\n",
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .fontSize)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 270,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 0, top: 50),
              child: Hero(
                tag: "${product?.name}",
                child: Image.network(
                  '${product?.images?.first}',
                  fit: BoxFit.fill,
                  width: 150,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
