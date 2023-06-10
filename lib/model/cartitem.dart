class Itemcart{
  String? title,image;
  double? price;
  Itemcart({this.price,this.image,this.title});
 Itemcart.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    image = json['image'];
  }



}