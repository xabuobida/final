class profilemodel {
  String? image,name,uid,phone,email,date;
  profilemodel({ this.image,this.date,this.email,this.name,this.phone,this.uid});
  profilemodel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uid = json['uid'];
    phone = json['phone'];
    date = json['date'];
    email = json['email'];
    image = json['image'];
  }
}
