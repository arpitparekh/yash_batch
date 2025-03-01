class Product {
  String? createdAt;
  String? name;
  int? quantity;
  int? price;
  String? id;

  Product({this.createdAt, this.name, this.quantity, this.price, this.id});

  Product.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['id'] = this.id;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Name : ${name}\nQuantity :  ${quantity}\nPrice : ${price}";
  }
}