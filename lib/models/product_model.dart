class ProductModelContent {
  final String productName;
  final String productColor;
  final String productSize;
  final String productImage;
  final int productPrice;
  int quantity;

  ProductModelContent(
      {required this.productName,
      required this.productColor,
      required this.productSize,
      required this.productPrice,
      required this.productImage,
      this.quantity = 1});
}

List<ProductModelContent> productModel = [
  ProductModelContent(
      productName: "Pullover",
      productColor: "Black",
      productSize: "L",
      productPrice: 51,
      productImage: "assets/image/t_shirt_1.png"),
  ProductModelContent(
      productName: "T-Shirt",
      productColor: "Gray",
      productSize: "L",
      productPrice: 30,
      productImage: "assets/image/t_shirt_1.png"),
  ProductModelContent(
      productName: "Sport Dress",
      productColor: "Black",
      productSize: "M",
      productPrice: 43,
      productImage: "assets/image/t_shirt_1.png")
];
