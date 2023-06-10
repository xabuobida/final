
class detalsModel {
  String? title;
  String? price;
  String? image;
  String? description;

  detalsModel({this.title, this.price, this.image, this.description});

  detalsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
  }
}