import 'package:flutter/material.dart';
import 'package:tkween/src/models/product_model.dart';


class ColorAndSize extends StatelessWidget {
  const ColorAndSize({
    Key? key,
     this.product,
  }) : super(key: key);

  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Color"),
            Container(
              width: 200,
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
              itemCount: product?.itemColor?.length,
              itemBuilder:(_,i){
                return ColorDot(
                  color: product?.itemColor![i],
                  isSelected:false,
                );
              }),
            )
          ],
        ),
      //   ColorDot(
      //     color: Color(0xFF356C95),
      //     isSelected: true,
      //   ),
      //   ColorDot(color: Color(0xFFF8C078)),
      //   ColorDot(color: Color(0xFFA29B9B)),
      // ],
        Spacer(),
        RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(text: "Size:  "),
              TextSpan(
                text: "${product?.itemSize} ",
                style: Theme.of(context)
                    .textTheme
                    .headline5,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color? color;
  final bool isSelected;
  const ColorDot({
    Key? key,
    this.color,
    // by default isSelected is false
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20 / 4,
        right: 20 / 2,
      ),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? Colors.black : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
