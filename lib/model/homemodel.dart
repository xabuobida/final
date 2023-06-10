class homemodel {
  String? title, price, image;
  homemodel({this.title, this.image, this.price});
  homemodel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    image = json['image'];
  }
}
