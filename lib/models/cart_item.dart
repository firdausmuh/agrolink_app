class CartItem {
  final String productName;
  final int stock;
  final int basePrice;
  final String description;
  final String imagePath;

  CartItem({
    required this.productName,
    required this.stock,
    required this.basePrice,
    required this.description,
    required this.imagePath,
  });
}
