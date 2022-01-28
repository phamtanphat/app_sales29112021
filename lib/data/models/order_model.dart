class OrderModel{
  String? orderId;
  int? total;

  OrderModel();

  OrderModel.fromJson(Map<String,dynamic> json){
    orderId = json['orderId'];
    total = json['total'];
  }
}