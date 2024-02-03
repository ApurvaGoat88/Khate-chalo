part of 'connectivity_bloc.dart';

@immutable
abstract class ConnectivityEvent {}


class ConnectivityLostEvent extends ConnectivityEvent{}
class ConnectivitySuccessEvent extends ConnectivityEvent{}