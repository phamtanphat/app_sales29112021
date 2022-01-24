class FooModel {
  String? foodId;
  String? foodName;
  List<Images>? images;
  String? description;
  int? price;
  String? cateId;
  String? cateName;
  String? createdAt;
  String? updatedAt;

  FooModel(
      {this.foodId,
        this.foodName,
        this.images,
        this.description,
        this.price,
        this.cateId,
        this.cateName,
        this.createdAt,
        this.updatedAt});

  FooModel.fromJson(Map<String, dynamic> json) {
    foodId = json['foodId'];
    foodName = json['foodName'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    description = json['description'];
    price = json['price'];
    cateId = json['cateId'];
    cateName = json['cateName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['foodId'] = this.foodId;
    data['foodName'] = this.foodName;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['price'] = this.price;
    data['cateId'] = this.cateId;
    data['cateName'] = this.cateName;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Images {
  String? imageUrl;

  Images({this.imageUrl});

  Images.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}