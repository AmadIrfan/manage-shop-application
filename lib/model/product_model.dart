import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Product {
  final String? id;
  final String? description;
  final int quantity;
  final String category;
  final double price;
  final String name;
  final String img;
  final bool isFavorite;
  DateTime? createDate;
  DateTime? updateDate;
  Product({
    this.id,
    this.description,
    required this.quantity,
    required this.category,
    required this.price,
    required this.name,
    required this.img,
    this.isFavorite = false,
    this.createDate,
    this.updateDate,
  }) {
    createDate = createDate ?? DateTime.now();
    updateDate = createDate ?? DateTime.now();
  }

  Product copyWith({
    ValueGetter<String?>? id,
    ValueGetter<String?>? description,
    int? quantity,
    String? category,
    double? price,
    String? name,
    String? img,
    bool? isFavorite,
    DateTime? createDate,
    DateTime? updateDate,
  }) {
    return Product(
      img: img ?? this.img,
      name: name ?? this.name,
      price: price ?? this.price,
      id: id != null ? id() : this.id,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
      isFavorite: isFavorite ?? this.isFavorite,
      createDate: createDate ?? this.createDate,
      updateDate: updateDate ?? this.updateDate,
      description: description != null ? description() : this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'quantity': quantity,
      'category': category,
      'price': price,
      'name': name,
      'img': img,
      'isFavorite': isFavorite,
      'createDate': createDate,
      'updateDate': updateDate,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      description: map['description'],
      quantity: map['quantity']?.toInt() ?? 0,
      category: map['category'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      name: map['name'] ?? '',
      img: map['img'] ?? '',
      isFavorite: map['isFavorite'] ?? false,
      createDate: map['createDate'] != null
          ? DateTime.parse(map['createDate'].toString())
          : null,
      updateDate: map['updateDate'] != null
          ? DateTime.parse(map['updateDate'].toString())
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, description: $description, quantity: $quantity, category: $category, price: $price, name: $name, img: $img, isFavorite: $isFavorite, createDate: $createDate, updateDate: $updateDate)';
  }
}
