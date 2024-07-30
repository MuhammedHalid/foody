part of 'route_bloc_bloc.dart';

@immutable
sealed class RouteBlocEvent {}

final class RouteNavigated extends RouteBlocEvent {
  final String currentPath;
  RouteNavigated({required this.currentPath});
}
