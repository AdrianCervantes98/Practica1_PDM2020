import 'package:practica_integradora_uno/models/product_repository.dart';
import 'package:flutter/foundation.dart';

class ProductItemCart {
  String productTitle;
  int productAmount;
  double productPrice;
  final ProductType typeOfProduct;
  String productImage;
  bool liked;


  ProductItemCart({
    this.typeOfProduct,
    @required this.productTitle,
    @required this.productAmount,
    @required this.productPrice,
    @required this.productImage,
    @required this.liked,
  });
}