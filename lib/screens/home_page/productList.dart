class Product {
  final String category;
  final String name;
  final String image;
  final int price;

  // Конструктор для инициализации объекта
  Product({
    required this.category,
    required this.name,
    required this.image,
    required this.price,
  });
}

 final List<Product> productList = [
    Product(
        category: 'Кофе с молоком',
        name: 'Олеато',
        image: 'assets/coffe.png',
        price: 139),
    Product(
        category: 'Кофе с молоком',
        name: 'Капучино',
        image: 'assets/coffe.png',
        price: 159),
    Product(
        category: 'Черный чай',
        name: 'Греческий чай',
        image: 'assets/coffe.png',
        price: 99),
    Product(
        category: 'Черный чай',
        name: 'Черный чай',
        image: 'assets/coffe.png',
        price: 119),
    Product(
        category: 'Американо',
        name: 'Американо',
        image: 'assets/coffe.png',
        price: 149),
    Product(
        category: 'Американо',
        name: 'Американо',
        image: 'assets/coffe.png',
        price: 149),
    Product(
        category: 'Авторские напитки',
        name: 'Черный чай',
        image: 'assets/coffe.png',
        price: 119),
    Product(
        category: 'Авторские напитки',
        name: 'Черный чай',
        image: 'assets/coffe.png',
        price: 119),
  ];