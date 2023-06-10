abstract class  SignInStates{}

class SignInInitState extends SignInStates{}

class SignInErrorState extends SignInStates{
  final String ? msgEr ;

  SignInErrorState({this.msgEr});

}
class SignInSuccessState extends SignInStates{
 final  String ? msg ;

  SignInSuccessState({this.msg});
}

class SignInLoadingState extends SignInStates{
  
}