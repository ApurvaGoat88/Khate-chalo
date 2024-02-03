import 'package:canteen_app/blocs/authentication_bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_textfield/gradient_textfield.dart';
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
final  email = TextEditingController() ;
final pass = TextEditingController() ;
bool _obsure = false ;

@override

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SingleChildScrollView(
        physics:const   BouncingScrollPhysics(

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 600.sp,
              width: double.infinity,


              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/food.jpg',),fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                        // color: Colors.black54,
                        offset: Offset(-1, 1),
                        blurRadius: 10,
                        spreadRadius: 0.01
                    )
                  ],
                  borderRadius: BorderRadius.only(bottomRight:  Radius.circular(100),bottomLeft: Radius.circular(100))
              ),

            ),
            SizedBox(
              height: 200.sp,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:30.0.sp),
                  child: SizedBox(
                    height: 120.sp,
                    child:  Text("WELCOME !",textAlign: TextAlign.start,style: TextStyle(
                      fontFamily: 'pro',
                      color: Colors.blueGrey,
                      fontSize:100.sp,
                      fontWeight: FontWeight.bold

                    ),),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100.sp,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:30.0.sp),
                  child: Text("Email",textAlign: TextAlign.start,style: TextStyle(
                    fontFamily: 'exo',

                    color: Colors.blueGrey,
                    fontSize:30.sp,

                  ),),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(20.sp),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.orange
                ),
                borderRadius: BorderRadius.circular(30.sp), // Border radius
              ),
              child: TextFormField(

                controller: email,
                onChanged: (value ){
                  BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(email.text, pass.text));
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.email,color: _obsure ? Colors.orange :Colors.grey,),
                  hintText: 'Enter Email',
                  hintStyle: const TextStyle(
                      fontFamily: 'exo',
                      color: Colors.black54),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none, // No border
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                ),
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:30.0.sp),
                  child: Text("Password",textAlign: TextAlign.start,style: TextStyle(
                    fontFamily: 'exo',

                    color: Colors.blueGrey,
                    fontSize:30.sp,

                  ),),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(20.sp),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.orange
                ),
                borderRadius: BorderRadius.circular(30.0.sp), // Border radius
              ),
              child: TextFormField(
                controller: pass,
                onChanged: (value ){
                  BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(email.text, pass.text));

                },
                obscureText: !_obsure,
                decoration: InputDecoration(
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      _obsure = !_obsure ;
                    });
                  }, icon: Icon(Icons.remove_red_eye ,color: _obsure ?Colors.orange:Colors.grey,)),
                  hintText: 'Enter Password',

                  hintStyle: const TextStyle(                        fontFamily: 'exo',
                      color: Colors.black54),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none, // No border
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:30.0.sp),
              child: GestureDetector(
                onTap: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: const Text('Forgot Password? ',style: TextStyle(
                        fontFamily: 'exo',
                        color: Colors.orange,

                      ),),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50.sp,
            ),
            BlocBuilder<SignInBloc,SignInState>(builder: (context, state){
              if (state is SignInErrorState){
                return Text(state.error,style: const TextStyle(
                    fontFamily: 'exo',

                    color: Colors.red
                ),);
              }
              else{
                return Container() ;
              }
            }),
            SizedBox(
              height: 20.sp,
            ),


            BlocBuilder<SignInBloc,SignInState>(
              builder: (context,state) {
                return ElevatedButton(onPressed: (){
                  if (state is SignInValidState){
                    print(email.text) ;
                    BlocProvider.of<SignInBloc>(context).add(SignInSubmittedEvent(email.text, pass.text));
                  }
                }, child:  const Text('Sign in',style: TextStyle(
                  fontFamily: 'exo',

                  color: Colors.white,
                  fontSize: 20,

                ),),
                style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.orange.shade800,
                  fixedSize: const Size(350, 50),
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  ),
                ),);
              }
            ),
            Padding(
              padding:  EdgeInsets.all(20.0.sp),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade300
                      ,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('or',style: TextStyle(
                      fontFamily: 'exo',
                      color: Colors.grey.shade500
                    ),),
                  ),
                  Expanded(
                    child: Divider(
                        color: Colors.grey.shade300
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
           GestureDetector(
             child:  Container(

                  height: 180.sp,
                 // width: 100.sp,
                 margin: EdgeInsets.all(20.sp),
                 decoration: BoxDecoration(
                   shape: BoxShape.rectangle,

                   border: Border.all(
                       color: Colors.orange
                   ),
                   borderRadius: BorderRadius.circular(30.sp), // Border radius
                 ),
             child: Padding(
               padding: const EdgeInsets.all(10.0),
               child: Image.asset('assets/images/google_logo.png'),
             ),),
             
           ),
            SizedBox(
              height: 10.sp,
            ),
            GestureDetector(
              onTap: (){},
              child: RichText(
                text: const TextSpan(
                  text: "Don't have ",
                  style: TextStyle(
                    fontFamily: 'exo',
                    color: Colors.black
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'an account?',
                      style: TextStyle(
                        fontFamily: 'exo',
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: ' Sign up',
                      style: TextStyle(
                        fontFamily: 'exo',

                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),


          ],
        ),
      )
    );
  }
}
