import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:turbo_waiter/features/home/domain/entities/categories_entity.dart';
import 'package:turbo_waiter/features/home/domain/entities/order_items.dart';
import 'package:turbo_waiter/features/home/domain/entities/sub_category_entity.dart';
import 'package:turbo_waiter/features/home/domain/src/categories.dart';
import 'package:turbo_waiter/features/home/domain/src/sub_category_entity.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    _initializeData();
  }

  void _initializeData() {
    emit(HomeLoaded(categories: categories, subCategories: subCategories));
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
