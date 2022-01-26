class CartModel{
  String? orderId;
  int? total;

  CartModel();

  CartModel.fromJson(Map<String,dynamic> json){
    orderId = json['orderId'];
    total = json['total'];
  }
}