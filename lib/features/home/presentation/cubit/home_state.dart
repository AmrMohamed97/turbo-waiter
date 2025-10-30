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
  final List<CategoryItemEntity> categories;
  final List<SubCategoryEntity> subCategories;
  final bool isLoading;

  const HomeLoaded({
    this.subCategories = const [],
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
    subCategories,
  ];

  HomeLoaded copyWith({
    String? searchQuery,
    String? customerName,
    String? selectedOrderType,
    List<OrderItem>? orderItems,
    List<CategoryItemEntity>? categories,
    bool? isLoading,
    List<SubCategoryEntity>? subCategories,
  }) {
    return HomeLoaded(
      searchQuery: searchQuery ?? this.searchQuery,
      customerName: customerName ?? this.customerName,
      selectedOrderType: selectedOrderType ?? this.selectedOrderType,
      orderItems: orderItems ?? this.orderItems,
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
      subCategories: subCategories ?? this.subCategories,
    );
  }
}


