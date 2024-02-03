part of 'connectivity_bloc.dart';

@immutable
abstract class ConnectivityState {}

class ConnectivityInitial extends ConnectivityState {}

class ConnectivityLostState extends ConnectivityState{}
class ConnectivitySuccessState extends ConnectivityState {}
