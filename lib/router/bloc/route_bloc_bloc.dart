
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'route_bloc_event.dart';
part 'route_bloc_state.dart';

class RouteBlocBloc extends Bloc<RouteBlocEvent, RouteBlocState> {
  RouteBlocBloc() : super(RouteBlocInitial()) {
    on<RouteNavigated>((event, emit) {
      // TODO: implement event handler
      
    });
  }
}
