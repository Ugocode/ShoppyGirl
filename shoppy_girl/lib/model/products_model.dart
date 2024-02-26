// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.id,
    this.brand,
    this.name,
    this.price,
    this.priceSign,
    this.currency,
    this.imageLink,
    this.productLink,
    this.websiteLink,
    this.description,
    this.rating,
    this.category,
    this.productType,
    this.tagList,
    this.createdAt,
    this.updatedAt,
    this.productApiUrl,
    this.apiFeaturedImage,
    this.productColors,
  });

  int? id;
  String? brand;
  String? name;
  String? price;
  PriceSign? priceSign;
  Currency? currency;
  String? imageLink;
  String? productLink;
  String? websiteLink;
  String? description;
  double? rating;
  Category? category;
  ProductType? productType;
  List<String>? tagList;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? productApiUrl;
  String? apiFeaturedImage;
  List<ProductColor>? productColors;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        brand: json["brand"],
        name: json["name"],
        price: json["price"],
        priceSign: json["price_sign"],
        currency: json["currency"] == null
            ? null
            : currencyValues.map?[json["currency"]],
        imageLink: json["image_link"],
        productLink: json["product_link"],
        websiteLink: json["website_link"],
        description: json["description"],
        // rating: json["rating"].toDouble(),
        category: json["category"] == null
            ? null
            : categoryValues.map?[json["category"]],
        productType: productTypeValues.map?[json["product_type"]],
        tagList: List<String>.from(json["tag_list"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        productApiUrl: json["product_api_url"],
        apiFeaturedImage: json["api_featured_image"],
        productColors: List<ProductColor>.from(
            json["product_colors"].map((x) => ProductColor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand,
        "name": name,
        "price": price,
        "price_sign":
            priceSign == null ? null : priceSignValues.reverse[priceSign],
        "currency": currency == null ? null : currencyValues.reverse[currency],
        "image_link": imageLink,
        "product_link": productLink,
        "website_link": websiteLink,
        "description": description,
        "rating": rating,
        "category": category == null ? null : categoryValues.reverse[category],
        "product_type": productTypeValues.reverse[productType],
        "tag_list": List<dynamic>.from(tagList!.map((x) => x)),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "product_api_url": productApiUrl,
        "api_featured_image": apiFeaturedImage,
        "product_colors":
            List<dynamic>.from(productColors!.map((x) => x.toJson())),
      };
}

enum Category {
  PENCIL,
  LIPSTICK,
  LIQUID,
  EMPTY,
  POWDER,
  LIP_GLOSS,
  GEL,
  CREAM,
  PALETTE,
  CONCEALER,
  HIGHLIGHTER,
  BB_CC,
  CONTOUR,
  LIP_STAIN,
  MINERAL
}

final categoryValues = EnumValues({
  "bb_cc": Category.BB_CC,
  "concealer": Category.CONCEALER,
  "contour": Category.CONTOUR,
  "cream": Category.CREAM,
  "": Category.EMPTY,
  "gel": Category.GEL,
  "highlighter": Category.HIGHLIGHTER,
  "lipstick": Category.LIPSTICK,
  "lip_gloss": Category.LIP_GLOSS,
  "lip_stain": Category.LIP_STAIN,
  "liquid": Category.LIQUID,
  "mineral": Category.MINERAL,
  "palette": Category.PALETTE,
  "pencil": Category.PENCIL,
  "powder": Category.POWDER
});

enum Currency { CAD, USD, GBP }

final currencyValues =
    EnumValues({"CAD": Currency.CAD, "GBP": Currency.GBP, "USD": Currency.USD});

enum PriceSign { EMPTY, PRICE_SIGN }

final priceSignValues =
    EnumValues({"\u0024": PriceSign.EMPTY, "£": PriceSign.PRICE_SIGN});

class ProductColor {
  ProductColor({
    this.hexValue,
    this.colourName,
  });

  String? hexValue;
  String? colourName;

  factory ProductColor.fromJson(Map<String, dynamic> json) => ProductColor(
        hexValue: json["hex_value"],
        colourName: json["colour_name"],
      );

  Map<String, dynamic> toJson() => {
        "hex_value": hexValue,
        "colour_name": colourName,
      };
}

enum ProductType {
  LIP_LINER,
  LIPSTICK,
  FOUNDATION,
  EYELINER,
  EYESHADOW,
  BLUSH,
  BRONZER,
  MASCARA,
  EYEBROW,
  NAIL_POLISH
}

final productTypeValues = EnumValues({
  "blush": ProductType.BLUSH,
  "bronzer": ProductType.BRONZER,
  "eyebrow": ProductType.EYEBROW,
  "eyeliner": ProductType.EYELINER,
  "eyeshadow": ProductType.EYESHADOW,
  "foundation": ProductType.FOUNDATION,
  "lipstick": ProductType.LIPSTICK,
  "lip_liner": ProductType.LIP_LINER,
  "mascara": ProductType.MASCARA,
  "nail_polish": ProductType.NAIL_POLISH
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map?.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
