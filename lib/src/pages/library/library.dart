import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:tkween/src/helpers/constants.dart';
import 'package:tkween/src/list_data/product_list.dart';
import 'package:tkween/src/models/product_model.dart';
import 'package:tkween/src/pages/library/pdf_view.dart';
import 'package:tkween/src/widgets/custom_app_bar.dart';


class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar(
        context,
        enableLeading: false,
        title: 'Library',
        actions: [
          IconButton(
            onPressed: () => Get.toNamed<dynamic>(Routes.search),
            icon: const Icon(FeatherIcons.search),
          ),
        ],
      ),
      body:Column(

        children: [
          Expanded(
            child: ResponsiveGridList(
              desiredItemWidth: 150,
              minSpacing: Const.margin,
              children: ProductList.flashSaleProductList.map((e) {
                final product = e;
                return _ProductCard(product: product);
              }).toList(),
            ),
          ),
      ],
      ),
    );
  }
}

class _ProductCard extends StatefulWidget {
  const _ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard> {
  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return GestureDetector(
      onTap: () async{
        fromAsset('assets/book.pdf', 'book.pdf').then((f) {
          setState(() {
            var pathPDF = f.path;
            Get.to(PDFScreen(path: pathPDF,));
          });
        });
      },
      child: Container(
        height: 220,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Spacer(),
            Container(height:2,color: Colors.white,),
            Container(
              width: double.maxFinite,
              height: 40,
              padding: const EdgeInsets.all(Const.space8),
              decoration: BoxDecoration(
                color: _theme.primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                         'Read',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                           fontSize: _theme.textTheme.bodyText2?.fontSize,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: Const.space8),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
