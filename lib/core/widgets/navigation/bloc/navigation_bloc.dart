import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_event.dart';

class NavigationBloc extends Bloc<NavigationEvent, int> {
  NavigationBloc() : super(0) {
    on<OnTapNav>((event, emit) {
      switch (event.tap) {
        case 0:
          emit(0);
          break;
        case 1:
          emit(1);
          break;
        case 2:
          emit(2);
          break;
        case 3:
          emit(3);
          break;
        case 4:
          emit(4);
          break;
        default:
          break;
      }
    });
  }
}
