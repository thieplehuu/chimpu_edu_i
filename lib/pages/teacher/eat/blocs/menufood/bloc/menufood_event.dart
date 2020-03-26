part of 'menufood_bloc.dart';

abstract class MenuFoodEvent extends Equatable {
  const MenuFoodEvent();
}

class AddMenuFood extends MenuFoodEvent {
  const AddMenuFood();

  @override
  List<Object> get props => null;
}