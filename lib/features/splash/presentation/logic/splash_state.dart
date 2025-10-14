part of 'splash_cubit.dart';

class SplashState extends Equatable {
  final int? currentPage;
  const SplashState({this.currentPage = -1});
  SplashState copyWith(
    {
      int? currentPage=-1,
    }
  ) {
    return SplashState(
      currentPage: currentPage??this.currentPage,
    );
  }
  @override
  List<Object> get props => [currentPage ?? -1];
}
