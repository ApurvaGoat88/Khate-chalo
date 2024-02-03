import 'package:canteen_app/blocs/authentication_bloc/sign_in_bloc.dart';
import 'package:canteen_app/blocs/connectivity_bloc/connectivity_bloc.dart';
import 'package:canteen_app/ui/connectivity/connection_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized() ;
  runApp(const ScreenUtilInit(designSize: Size(980, 462),
  child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return   MultiBlocProvider(

      providers: [
        BlocProvider(create: (_) => ConnectivityBloc()),
        BlocProvider(create: (_)=>SignInBloc())
      ],
      child:const  MaterialApp(
        debugShowCheckedModeBanner: false,

        home:  ConnectionCheck(),
      ),
    );
  }
}

