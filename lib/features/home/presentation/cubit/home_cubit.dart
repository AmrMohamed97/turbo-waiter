import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    _initializeData();
  }

  void _initializeData() {
    final categories = [
      const CategoryItem(
        id: '1',
        name: 'إيدامات',
        imagePath: 'assets/images/stew.png',
        color: 'orange2',
      ),
      const CategoryItem(
        id: '2',
        name: 'صوصات',
        imagePath: 'assets/images/sauce.png',
        color: 'orange3',
      ),
      const CategoryItem(
        id: '3',
        name: 'مقرمشات',
        imagePath: 'assets/images/crisps.png',
        color: 'orange4',
      ),
      const CategoryItem(
        id: '4',
        name: 'ساندويتشات',
        imagePath: 'assets/images/sandwich.png',
        color: 'orange1',
      ),
      const CategoryItem(
        id: '5',
        name: 'مشروبات',
        imagePath: 'assets/images/drinks.png',
        color: 'primaryColor',
      ),
      const CategoryItem(
        id: '6',
        name: 'حلى',
        imagePath: 'assets/images/desserts.png',
        color: 'orange2',
      ),
      const CategoryItem(
        id: '7',
        name: 'سلطات',
        imagePath: 'assets/images/salads.png',
        color: 'green1',
      ),
      const CategoryItem(
        id: '8',
        name: 'أطباق رئيسية',
        imagePath: 'assets/images/main_dishes.png',
        color: 'orange3',
      ),
      const CategoryItem(
        id: '9',
        name: 'Apps - إيدامات',
        imagePath: 'assets/images/apps_stew.png',
        color: 'orange2',
      ),
      const CategoryItem(
        id: '10',
        name: 'Apps - صوصات',
        imagePath: 'assets/images/apps_sauce.png',
        color: 'orange3',
      ),
      const CategoryItem(
        id: '11',
        name: 'Apps - مقرمشات',
        imagePath: 'assets/images/apps_crisps.png',
        color: 'orange4',
      ),
      const CategoryItem(
        id: '12',
        name: 'Apps - الساندويتشات',
        imagePath: 'assets/images/apps_sandwich.png',
        color: 'orange1',
      ),
    ];

    emit(HomeLoaded(categories: categories));
  }

  void updateSearchQuery(String query) {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      emit(currentState.copyWith(searchQuery: query));
    }
  }

  void updateCustomerName(String name) {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      emit(currentState.copyWith(customerName: name));
    }
  }

  void updateOrderType(String orderType) {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      emit(currentState.copyWith(selectedOrderType: orderType));
    }
  }

  void addOrderItem(OrderItem item) {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      final updatedItems = List<OrderItem>.from(currentState.orderItems);
      updatedItems.add(item);
      emit(currentState.copyWith(orderItems: updatedItems));
    }
  }

  void removeOrderItem(String itemId) {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      final updatedItems = currentState.orderItems
          .where((item) => item.id != itemId)
          .toList();
      emit(currentState.copyWith(orderItems: updatedItems));
    }
  }

  void clearOrder() {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      emit(currentState.copyWith(orderItems: []));
    }
  }

  void onCategorySelected(String categoryId) {
    // Handle category selection logic here
    // This could navigate to a category detail screen or show items
  }

  void onAddCustomer() {
    // Handle add customer action
  }

  void onViewPreviousOrders() {
    // Handle view previous orders action
  }

  void onApplyCoupon() {
    // Handle coupon application
  }

  void onViewOffers() {
    // Handle view offers action
  }

  void onEndShift() {
    // Handle end shift action
  }

  void onProceedToPayment() {
    // Handle proceed to payment action
  }
}
