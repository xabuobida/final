
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testbuild/Screen/tabbar.dart';
import 'package:testbuild/view/Signup/SignUp.dart';
import 'package:testbuild/view/home/home.dart';
import 'package:testbuild/viewModel/Signin/cubit.dart';
import 'package:testbuild/viewModel/Signin/states.dart';

class SigInScreen extends StatefulWidget {
  const SigInScreen({super.key});

  @override
  State<SigInScreen> createState() => _SigInScreenState();
}

class _SigInScreenState extends State<SigInScreen> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  void dispose() {
    
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => SignInCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(
         children: <Widget>[
    
              const SizedBox(height: 30,),
              const Padding(
                padding: EdgeInsets.symmetric( horizontal:20.0),
                child: Text("Welcome Back",
                style: TextStyle(fontSize: 35,
                fontWeight: FontWeight.bold,
                ),            
                ),
              ),
              const SizedBox(height: 30,),
               Padding(
                padding:const  EdgeInsets.all(20.0),
                child: TextField(
                  decoration: const  InputDecoration(border: 
                  OutlineInputBorder(),
                  hintText: "E-mail"
                  ),
                  controller: controllerEmail,
                ),
              ),
    
                Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: TextField(
                  decoration: const  InputDecoration(border: 
                  OutlineInputBorder(),
                  hintText: "Password"
                  ),
                  controller: controllerPassword,
                           ),
               ),
               TextButton(onPressed: (){
                //'
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignUpScreen()));
               }, child: Text("Sign up",style: TextStyle(fontSize: 16),),),
              const SizedBox(height: 100,),
    
               BlocConsumer<SignInCubit,SignInStates>(
                builder: (context, state) {
                  //
                  if (state is SignInLoadingState) {
                    
                    return const  Center(child: CircularProgressIndicator());
                  } else {
                    return Padding(
                   padding: const EdgeInsets.symmetric(horizontal:20.0),
                   child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width/1.5,
                     child: ElevatedButton(onPressed: (){
                    //
                      context.read<SignInCubit>().sigInUser(
                        email: controllerEmail.text.trim(),
                        password: controllerPassword.text.trim(),
                      );
                     }, child: const Text("Sign in",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),),
                   ),
                 );
                  }
                 
                },
                listener: (context, state) {
                  //
                  if (state is SignInSuccessState) {
                    //

                    var snackBar = SnackBar(
                       content: Text("Welcome ${state.msg!}",style: TextStyle(color: Colors.white,),),
                       backgroundColor: Colors.green,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                      
                      builder: (context)=> Home()
                      
                       ),
                    
                     (route) => false);
                  } else if(state is SignInErrorState){
                    //
                     var snackBar = SnackBar(
                       content: Text(state.msgEr!,style: TextStyle(color: Colors.white),),
                       backgroundColor: Colors.red,

                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  }else{
                    //
                  }
                },
               )
            ],
        
        ),
      ),
    );
  }
}