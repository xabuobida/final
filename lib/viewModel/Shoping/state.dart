abstract class ShopStates{}
class ShopInitState extends ShopStates{}

class ShopErrortState extends ShopStates{
  final  String ? Ermsg ;

  ShopErrortState({this.Ermsg});
}
class ShopSuccustState extends ShopStates{

  final  String ? msg ;

  ShopSuccustState({this.msg});
}
 class ShopLoadingtState extends ShopStates{}