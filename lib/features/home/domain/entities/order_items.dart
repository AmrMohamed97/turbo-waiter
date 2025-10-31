class OrderItem {
  String id;
  String name;
  int quantity;
  double price;

  OrderItem({this.id = '', this.name = '', this.quantity = 0, this.price = 0});

  List<Object> get props => [id, name, quantity, price];
  OrderItem copyWith({int? quantity, double? price, String? name, String? id}) {
    return OrderItem(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }
}
