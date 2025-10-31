part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  String searchQuery;
  String customerName;
  String selectedOrderType;
  List<OrderItem> orderItems = [];
  List<CategoryItemEntity> categories = [];
  List<SubCategoryEntity> subCategories = [];
  bool isLoading = false;

  HomeLoaded({
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
