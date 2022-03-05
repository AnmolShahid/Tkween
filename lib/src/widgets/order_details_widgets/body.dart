import 'package:flutter/material.dart';
import 'package:tkween/src/models/product_model.dart';

import 'description.dart';
import 'product_title_with_image.dart';

class Body extends StatelessWidget {
  final ProductModel? product;

  const Body({Key? key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    final _theme = Theme.of(context);
    return SingleChildScrollView(
      child: Container(
        color: _theme.backgroundColor,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: 20,
                    right: 20,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: _theme.backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 50),
                      // ColorAndSize(product: product),
                      //  SizedBox(height: 20 / 2),
                      //  textField(type: 'المؤلف :',title: 'علي حسن العلي'),
                      //  SizedBox(height:10),
                      //  textField(type: ' نوع الكتاب :',title: 'كتاب إلكتروني, كتاب ورقي'),
                      //  SizedBox(height:10),
                      //  textField(type: ' اللغة :',title: 'العربية'),
                      //  SizedBox(height:10),
                      //  textField(type: ' الناشر :',title: 'شركة تكوين العالمية للنشر والتوزيع'),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Table(
                          // textDirection: TextDirection.rtl,
                          // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                          border:
                              TableBorder.all(width: 1.0, color: Colors.grey),
                          children: [
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  "لمؤلف",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  "علي حسن العلي",
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  "اللغة",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  "لعربية",
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  "الناشر",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  "شركة تكوين العالمية للنشر والتوزيع",
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                      Description(product: product),
                      SizedBox(height: 20 / 2),
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product),
              ],
            )
          ],
        ),
      ),
    );
  }

  Row textField({required String type, required String title}) {
    return Row(
      children: [
        Text(
          type,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        SizedBox(
          width: 5,
        ),
        Text(title, style: TextStyle(fontSize: 14, color: Colors.black))
      ],
    );
  }
}
