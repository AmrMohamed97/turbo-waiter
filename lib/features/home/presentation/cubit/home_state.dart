part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final String searchQuery;
  final String customerName;
  final String selectedOrderType;
  final List<OrderItem> orderItems;
  final List<CategoryItem> categories;
  final bool isLoading;

  const HomeLoaded({
    this.searchQuery = '',
    this.customerName = '',
    this.selectedOrderType = 'داخل المطعم',
    this.orderItems = const [],
    this.categories = const [],
    this.isLoading = false,
  });

  @override
  List<Object> get props => [
    searchQuery,
    customerName,
    selectedOrderType,
    orderItems,
    categories,
    isLoading,
  ];

  HomeLoaded copyWith({
    String? searchQuery,
    String? customerName,
    String? selectedOrderType,
    List<OrderItem>? orderItems,
    List<CategoryItem>? categories,
    bool? isLoading,
  }) {
    return HomeLoaded(
      searchQuery: searchQuery ?? this.searchQuery,
      customerName: customerName ?? this.customerName,
      selectedOrderType: selectedOrderType ?? this.selectedOrderType,
      orderItems: orderItems ?? this.orderItems,
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class OrderItem {
  final String id;
  final String name;
  final int quantity;
  final double price;

  const OrderItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });

  List<Object> get props => [id, name, quantity, price];
}

class CategoryItem {
  final String id;
  final String name;
  final String imagePath;
  final String color;

  const CategoryItem({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.color,
  });

  List<Object> get props => [id, name, imagePath, color];
}
