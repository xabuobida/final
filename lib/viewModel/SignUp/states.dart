abstract class SignUpStates {}
class SignUpInitState extends SignUpStates{}

class SignUpLoadingState extends SignUpStates{}

class SignUpSuccessState extends SignUpStates{
  final String ? msg ;

  SignUpSuccessState({this.msg}); 

}

class SignUpErrorState extends SignUpStates{}


class SignUpPickDateState extends SignUpStates{}