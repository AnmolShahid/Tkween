class CartModel {
  final int? orderId;
  int? qty;
  int? price;
  final int? size;
  final int? color;
  final String? productName;
  final String? productImage;

  CartModel(
      {this.orderId,
      this.qty,
      this.price,
      this.size,
      this.color,
      this.productName,
      this.productImage});
}
