import 'package:flutter/material.dart';
import 'package:flutter_assignment_3/models/product_model.dart';
import 'package:flutter_assignment_3/presentation/screens/sub_sections/product_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  double totalAmount = 0;

  @override
  void initState() {
    super.initState();
    calculateTotalAmount();
  }

  void calculateTotalAmount() {
    totalAmount = productModel.fold(
        0, (sum, item) => sum + (item.productPrice * item.quantity));
  }

  void increaseQuantity(int index) {
    setState(() {
      productModel[index].quantity++;
      calculateTotalAmount();
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (productModel[index].quantity > 1) {
        productModel[index].quantity--;
        calculateTotalAmount();
      }
    });
  }

  void showCheckOutSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Congratulations! Your checkout is successful!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final product = productModel[index];
                    return ProductItems(
                      product: product,
                      index: index,
                      increaseQuantity: () => increaseQuantity(index),
                      decreaseQuantity: () => decreaseQuantity(index),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: productModel.length),
            ),
            buildTotalAmount(),
            const SizedBox(
              height: 10,
            ),
            buildCheckOutButton()
          ],
        ),
      ),
    );
  }

  Widget buildCheckOutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: showCheckOutSnackbar,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 20),
            backgroundColor: Colors.red,
          ),
          child: const Text(
            "CHECK OUT",
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  Widget buildTotalAmount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Total amount:",
          style: TextStyle(color: Colors.grey),
        ),
        Text(
          "$totalAmount\$",
          style: const TextStyle(fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.5,
      backgroundColor: Colors.white,
      title: const Text(
        "My Bag",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }
}
