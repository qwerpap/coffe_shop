import 'package:flutter/material.dart';
import 'category.dart';
import 'productCard.dart';
import 'productList.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  Map<String, List<Product>> categorizedProducts = {};

  // Состояние корзины (индекс товара -> количество)
  Map<int, int> cart = {};

  @override
  void initState() {
    super.initState();
    categorizedProducts = _categorizeProducts(productList);
  }

  Map<String, List<Product>> _categorizeProducts(List<Product> products) {
    Map<String, List<Product>> categorized = {};
    for (var product in products) {
      if (!categorized.containsKey(product.category)) {
        categorized[product.category] = [];
      }
      categorized[product.category]?.add(product);
    }
    return categorized;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const Category(),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                itemCount: categorizedProducts.keys.length,
                itemBuilder: (context, index) {
                  String category = categorizedProducts.keys.elementAt(index);
                  List<Product> productsInCategory =
                      categorizedProducts[category]!;
      
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          category,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: productsInCategory.length,
                        itemBuilder: (context, index) {
                          final product = productsInCategory[index];
                          return ProductCard(
                            product: product,
                            onAddToCart: () => _addToCart(product),
                            onRemoveFromCart: () => _removeFromCart(product),
                            cartQuantity: cart[product.hashCode] ?? 0,
                            onIncrease: () => _increaseQuantity(product),
                            onDecrease: () => _decreaseQuantity(product),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addToCart(Product product) {
    setState(() {
      cart[product.hashCode] = (cart[product.hashCode] ?? 0) + 1;
    });
  }

  void _removeFromCart(Product product) {
    setState(() {
      cart.remove(product.hashCode);
    });
  }

  void _increaseQuantity(Product product) {
    setState(() {
      if (cart[product.hashCode]! < 10) {
        cart[product.hashCode] = cart[product.hashCode]! + 1;
      }
    });
  }

  void _decreaseQuantity(Product product) {
    setState(() {
      if (cart[product.hashCode]! > 1) {
        cart[product.hashCode] = cart[product.hashCode]! - 1;
      } else {
        _removeFromCart(product);
      }
    });
  }
}

