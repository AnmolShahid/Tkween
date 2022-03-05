part of '../product_page.dart';

class DetailsScreen extends StatefulWidget {
  final ProductModel? product;

  DetailsScreen({Key? key, this.product}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      // each product have a color

      appBar: buildAppBar(context),
      body: Body(product: widget.product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    final _theme = Theme.of(context);
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: _theme.primaryColor,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        if (isLiked) ...[
          GestureDetector(
              onTap: () {
                setState(() {
                  isLiked = !isLiked;
                });
              },
              child: Container(
                  padding: EdgeInsets.all(4),
                  decoration:
                      BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  child: Icon(
                    Icons.favorite,
                    color: _theme.primaryColor,
                    size: 20,
                  )))
        ] else ...[
          GestureDetector(
              onTap: () {
                setState(() {
                  isLiked = !isLiked;
                });
              },
              child: Icon(
                Icons.favorite_border,
                color: Colors.grey,
              )),
        ],
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
