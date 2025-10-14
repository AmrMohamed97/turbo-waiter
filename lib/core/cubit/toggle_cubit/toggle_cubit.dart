import 'package:flutter_bloc/flutter_bloc.dart';

class ToggleCubit extends Cubit<bool?> {
  ToggleCubit() : super(null);

  bool? isToggled;

  void setIsToggled(bool value) {
    isToggled = value;
    emit(isToggled);
  }

  void toggle(bool? toggle, {void Function(bool?)? onToggle}) {
    isToggled = toggle;
    onToggle?.call(isToggled);
    emit(isToggled);
  }
}
