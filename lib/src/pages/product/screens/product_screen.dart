part of '../product_page.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool _isLiked = false;
  int _qty = 1;
  late ProductModel product;

  @override
  void initState() {
    super.initState();
    product = Get.arguments as ProductModel;
  }

  @override
  Widget build(BuildContext context) {
    final _discountPrice = product.price! * (product.discount / 100);
    final _price = product.price! - _discountPrice;
    return Scaffold(
      body: Column(
        children: [

          Expanded(child: DetailsScreen(product: product,)),



          _FooterSection(
            product: product,
            qty: _qty,
            total: _price.toInt() * _qty,
            onAddTap: () {
              setState(() => _qty = max(1, _qty + 1));
            },
            onRemoveTap: () {
              if (_qty != 1) {
                setState(() {
                  _qty = min(50, _qty - 1);
                });
              }
            },
            onAddToCartTap: () {
              CartModel cart = new CartModel(productName: product.name, productImage: product.images!.first, price: product.price, qty: _qty);
              CartList.cartList.add(cart);
              showToast(msg: AppLocalizations.of(context)!.added_to_cart);
            },
          )
        ],
      ),
    );
  }
}
