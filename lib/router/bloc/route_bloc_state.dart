part of 'route_bloc_bloc.dart';

@immutable
sealed class RouteBlocState {}

final class RouteBlocInitial extends RouteBlocState {}

final class RouteLocated extends RouteBlocState{}