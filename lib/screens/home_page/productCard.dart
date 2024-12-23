import 'package:flutter/material.dart';
import 'productList.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;
  final VoidCallback onRemoveFromCart;
  final int cartQuantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const ProductCard({
    Key? key,
    required this.product,
    required this.onAddToCart,
    required this.onRemoveFromCart,
    required this.cartQuantity,
    required this.onIncrease,
    required this.onDecrease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            child: Image.asset(product.image, fit: BoxFit.contain),
          ),
          const SizedBox(height: 15),
          Text(
            product.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          if (cartQuantity == 0)
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
              child: ElevatedButton(
                onPressed: onAddToCart,
                child: Text('${product.price} руб'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            )
          else
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: onDecrease,
                    ),
                    Text(
                      '  $cartQuantity  ',
                      style: const TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: onIncrease,
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}
