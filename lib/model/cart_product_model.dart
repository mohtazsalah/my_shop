class CartProductModel {
  String? name , image , price ,productId;
  int? quantity;

  CartProductModel({this.name, this.image, this.price, this.quantity , this.productId});

  CartProductModel.fromJson(Map<dynamic , dynamic> map){
    if(map == null){
      return;
    }
    name = map['name'];
    image = map['image'];
    price = map['price'];
    productId = map['productId'];
    quantity = map['quantity'];
  }

  toJson(){
    return {
      'name' : name,
      'image' : image,
      'price' : price,
      'productId' : productId,
      'quantity' : quantity,
    };
  }
}