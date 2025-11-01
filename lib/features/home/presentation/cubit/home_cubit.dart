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
    emit(HomeLoaded(categories: categories, subCategories: []));
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
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      final updatedSubCategories = subCategories.where((subCategory) {
        return subCategory.categoryId == categoryId;
      }).toList();
      emit(currentState.copyWith(subCategories: updatedSubCategories));
    }
  }

  void clearSubCategories() {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      emit(currentState.copyWith(subCategories: []));
    }
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

  void onConfirmCart() {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      if (currentState.orderItems.isNotEmpty) {
        emit(ConfirmCartState());
      }
    }
  }

  void onSubCategorySelected(SubCategoryEntity subcategory) {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      final List<OrderItem> updatedOrderItems = List<OrderItem>.from(
        currentState.orderItems,
      );

      final int existingIndex = updatedOrderItems.indexWhere(
        (item) => item.id == subcategory.id,
      );

      if (existingIndex == -1) {
        updatedOrderItems.add(
          OrderItem(
            id: subcategory.id,
            name: subcategory.name,
            price: subcategory.price,
            quantity: 1,
          ),
        );
      } else {
        final OrderItem existing = updatedOrderItems[existingIndex];
        updatedOrderItems[existingIndex] = existing.copyWith(
          quantity: existing.quantity + 1,
        );
      }

      emit(currentState.copyWith(orderItems: updatedOrderItems));
    }
  }

  void onRemoveItem(OrderItem orderItem) {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      final List<OrderItem> updatedOrderItems = List<OrderItem>.from(
        currentState.orderItems,
      );

      updatedOrderItems.removeWhere((element) {
        return element.id == orderItem.id;
      });
      emit(currentState.copyWith(orderItems: updatedOrderItems));
    }
  }

  void onIncrementItem(OrderItem item) {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      final List<OrderItem> updatedOrderItems = List<OrderItem>.from(
        currentState.orderItems,
      );

      int existingIndex = updatedOrderItems.indexWhere(
        (element) => element.id == item.id,
      );
      SubCategoryEntity subCategory = subCategories.firstWhere(
        (element) => element.id == item.id,
      );

      if (existingIndex != -1) {
        if (updatedOrderItems[existingIndex].quantity < subCategory.quantity) {
          updatedOrderItems[existingIndex] = updatedOrderItems[existingIndex]
              .copyWith(
                quantity: updatedOrderItems[existingIndex].quantity + 1,
              );
        } else {
          updatedOrderItems[existingIndex] = updatedOrderItems[existingIndex]
              .copyWith(
                quantity: updatedOrderItems[existingIndex].quantity - 1,
              );
        }
      }
      emit(currentState.copyWith(orderItems: updatedOrderItems));
    }
  }

  void onDecrementItem(OrderItem item) {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      final List<OrderItem> updatedOrderItems = List<OrderItem>.from(
        currentState.orderItems,
      );
      int existingIndex = updatedOrderItems.indexWhere(
        (element) => element.id == item.id,
      );
      if (existingIndex != -1) {
        if (updatedOrderItems[existingIndex].quantity > 1) {
          updatedOrderItems[existingIndex] = updatedOrderItems[existingIndex]
              .copyWith(
                quantity: updatedOrderItems[existingIndex].quantity - 1,
              );
        }
      }
      emit(currentState.copyWith(orderItems: updatedOrderItems));
    }
  }
}
