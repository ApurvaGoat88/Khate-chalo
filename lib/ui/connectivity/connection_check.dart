import 'package:canteen_app/blocs/connectivity_bloc/connectivity_bloc.dart';
import 'package:canteen_app/ui/home/view/home_view.dart';
import 'package:canteen_app/ui/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ConnectionCheck extends StatelessWidget {
  const ConnectionCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: BlocBuilder<ConnectivityBloc,ConnectivityState>(builder: (context , state){
         if(state is ConnectivitySuccessState){
           return const LoginView();
          }
         else if (state is ConnectivityLostState){
           return Center(child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(child: Image.asset('assets/images/nointernet.jpg')),
               Text('No Internet!',style: TextStyle(
                 fontFamily: 'pro'
                     ,
                 fontSize: 100.sp
               ),)
             ],
           ));
          }
         else{
           return const CircularProgressIndicator() ;
         }
        }),
      ),
    );
  }
}
