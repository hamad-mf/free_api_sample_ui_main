// To parse this JSON data, do
//
//     final productResModel = productResModelFromJson(jsonString);

import 'dart:convert';

ProductResModel productResModelFromJson(String str) => ProductResModel.fromJson(json.decode(str));

String productResModelToJson(ProductResModel data) => json.encode(data.toJson());

class ProductResModel {
    String? msg;
    List<ProductModel>? data;

    ProductResModel({
        this.msg,
        this.data,
    });

    factory ProductResModel.fromJson(Map<String, dynamic> json) => ProductResModel(
        msg: json["Msg"],
        data: json["data"] == null ? [] : List<ProductModel>.from(json["data"]!.map((x) => ProductModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Msg": msg,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class ProductModel {
    int? id;
    String? name;
    String? description;
    String? price;
    int? stock;
    String? category;
    dynamic imageUrl;

    ProductModel({
        this.id,
        this.name,
        this.description,
        this.price,
        this.stock,
        this.category,
        this.imageUrl,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stock: json["stock"],
        category: json["category"],
        imageUrl: json["image_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "stock": stock,
        "category": category,
        "image_url": imageUrl,
    };
}
