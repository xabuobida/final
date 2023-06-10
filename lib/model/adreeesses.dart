class ChangeAdressModel {
  String? adreessescity, adreessescountry, adreessesstreet, date, email, image,name,phone,uid;
    ChangeAdressModel({this.adreessescity,this.adreessescountry,this.adreessesstreet,this.date,this.email,this.uid});

  ChangeAdressModel.fromJson(Map<String, dynamic> json) {
    adreessescity = json['adreessescity'];
    adreessescountry = json['adreessescountry'];
    adreessesstreet = json['adreessesstreet'];
    date = json['date'];
    email = json['email'];
    image = json['image'];
    name = json['name'];
    phone = json['phone'];
    uid = json['uid'];

  }
}
