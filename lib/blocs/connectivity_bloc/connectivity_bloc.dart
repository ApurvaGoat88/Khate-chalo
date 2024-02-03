import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  Connectivity connectivity = Connectivity() ;
  ConnectivityBloc() : super(ConnectivityInitial()) {
    on<ConnectivityLostEvent>((event, emit) => emit(ConnectivityLostState()));
    on<ConnectivitySuccessEvent>((event, emit) => emit(ConnectivitySuccessState()) ) ;

    connectivity.onConnectivityChanged.listen((event) {
      if(event == ConnectivityResult.mobile || event  == ConnectivityResult.wifi){
        add(ConnectivitySuccessEvent());
      }
      else{
        add(ConnectivityLostEvent()) ;
      }
    }) ;
  }


}
