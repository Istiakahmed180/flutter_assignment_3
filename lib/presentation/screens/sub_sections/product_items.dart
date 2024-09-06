import 'package:flutter/material.dart';
import 'package:flutter_assignment_3/models/product_model.dart';

class ProductItems extends StatelessWidget {
  final ProductModelContent product;
  final int index;
  final Function()? increaseQuantity;
  final Function()? decreaseQuantity;

  const ProductItems({
    super.key,
    required this.product,
    required this.index,
    required this.increaseQuantity,
    required this.decreaseQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [buildBoxShadow()]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              product.productImage,
              width: 80,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    trailing: PopupMenuButton(
                      iconColor: Colors.grey,
                      iconSize: 20,
                      itemBuilder: (context) {
                        return <PopupMenuEntry<String>>[];
                      },
                    ),
                    title: Text(product.productName),
                    titleTextStyle: const TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                    subtitle: Row(
                      children: [
                        buildRichText(product, "Color", product.productColor),
                        const SizedBox(
                          width: 10,
                        ),
                        buildRichText(product, "Size", product.productSize),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            buildAddRemoveButton(
                                decreaseQuantity, Icons.remove),
                            const SizedBox(
                              width: 15,
                            ),
                            Text("${product.quantity}"),
                            const SizedBox(
                              width: 15,
                            ),
                            buildAddRemoveButton(increaseQuantity, Icons.add),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          "${(product.productPrice * product.quantity)}\$",
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  BoxShadow buildBoxShadow() {
    return BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 5,
        offset: const Offset(0, 3));
  }

  RichText buildRichText(
      ProductModelContent product, String title, String productInfo) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "$title: ",
          style: const TextStyle(color: Colors.grey, fontSize: 13)),
      TextSpan(
          text: productInfo,
          style: const TextStyle(color: Colors.black, fontSize: 13)),
    ]));
  }

  Widget buildAddRemoveButton(Function()? onTap, IconData icon) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [buildBoxShadow()]),
        child: CircleAvatar(
          radius: 15,
          backgroundColor: Colors.white,
          child: Icon(
            icon,
            size: 20,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
