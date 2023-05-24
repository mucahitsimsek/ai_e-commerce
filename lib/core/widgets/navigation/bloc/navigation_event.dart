part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class OnTapNav extends NavigationEvent {
  final int tap;
  const OnTapNav(this.tap);
}
