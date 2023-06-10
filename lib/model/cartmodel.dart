class CartModel {
  String? title, price, image;
  CartModel({required this.title, required this.image,required  this.price});
  CartModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    image = json['image'];
  }

  static const List <CartModel> CartItems=[];
}
