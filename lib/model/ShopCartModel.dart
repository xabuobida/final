class ShopCartModel {
  String? title, price, image;
  ShopCartModel({this.title, this.image, this.price});
  ShopCartModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    image = json['image'];
  }
}
