import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/models/product_cup.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';
import 'package:practica_integradora_uno/models/product_item_cart.dart';
import 'package:practica_integradora_uno/models/product_repository.dart';

// home
const String APP_TITLE = "Coffe shop";
// profile
const String PROFILE_TITLE = "Perfil";
const String PROFILE_LOGOUT = "Cerrar sesion";
const String PROFILE_CART = "Lista de compras";
const String PROFILE_WISHES = "Lista de deseos";
const String PROFILE_HISTORY = "Historial de compras";
const String PROFILE_SETTINGS = "Ajustes";
const String PROFILE_NAME = "Anna Doe";
const String PROFILE_EMAIL = "anna@doe.com";
const String PROFILE_PW = "hola";
const String PROFILE_PICTURE =
    "https://vckit.themelego.com/wp-content/uploads/2017/04/2-1-300x300.png";

List<ProductDrinks> drinkList = ProductRepository.loadProducts(ProductType.BEBIDAS);
List<ProductCup> cupList = ProductRepository.loadProducts(ProductType.TAZAS);
List<ProductGrains> grainList = ProductRepository.loadProducts(ProductType.GRANO);
List<ProductItemCart> cartList = new List<ProductItemCart>();
List<String> prodsInCart = new List<String>();
// app
//Color PRIMARY_COLOR = const Color(0xFF214254);
const MaterialColor PRIMARY_COLOR = const MaterialColor(
  0xFF214254,
  const <int, Color>{
    50: const Color(0xFF214254),
    100: const Color(0xFF214254),
    200: const Color(0xFF214254),
    300: const Color(0xFF214254),
    400: const Color(0xFF214254),
    500: const Color(0xFF214254),
    600: const Color(0xFF214254),
    700: const Color(0xFF214254),
    800: const Color(0xFF214254),
    900: const Color(0xFF214254),
  },
);
//const Color BUTTON_COLOR = Color(0xFF8B8175);
const MaterialColor BUTTON_COLOR = const MaterialColor(
  0xFF8B8175,
  const <int, Color>{
    50: const Color(0xFF8B8175),
    100: const Color(0xFF8B8175),
    200: const Color(0xFF8B8175),
    300: const Color(0xFF8B8175),
    400: const Color(0xFF8B8175),
    500: const Color(0xFF8B8175),
    600: const Color(0xFF8B8175),
    700: const Color(0xFF8B8175),
    800: const Color(0xFF8B8175),
    900: const Color(0xFF8B8175),
  },
);
//const Color IMAGE_BG_COLOR = Color(0xFFFABF7C);
const MaterialColor IMAGE_BG_COLOR = const MaterialColor(
  0xFFFABF7C,
  const <int, Color>{
    50: const Color(0xFFFABF7C),
    100: const Color(0xFFFABF7C),
    200: const Color(0xFFFABF7C),
    300: const Color(0xFFFABF7C),
    400: const Color(0xFFFABF7C),
    500: const Color(0xFFFABF7C),
    600: const Color(0xFFFABF7C),
    700: const Color(0xFFFABF7C),
    800: const Color(0xFFFABF7C),
    900: const Color(0xFFFABF7C),
  },
);
//const Color BG_COLOR = Color(0xFFFFFFFF);
const MaterialColor BG_COLOR = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);
//const Color TEXT_COLOR = Color(0xFF121B22);
const MaterialColor TEXT_COLOR = const MaterialColor(
  0xFF121B22,
  const <int, Color>{
    50: const Color(0xFF121B22),
    100: const Color(0xFF121B22),
    200: const Color(0xFF121B22),
    300: const Color(0xFF121B22),
    400: const Color(0xFF121B22),
    500: const Color(0xFF121B22),
    600: const Color(0xFF121B22),
    700: const Color(0xFF121B22),
    800: const Color(0xFF121B22),
    900: const Color(0xFF121B22),
  },
);
//const Color DESC_TEXT_COLOR = Color(0xFFBCB0A1);
const MaterialColor DESC_TEXT_COLOR = const MaterialColor(
  0xFFBCB0A1,
  const <int, Color>{
    50: const Color(0xFFBCB0A1),
    100: const Color(0xFFBCB0A1),
    200: const Color(0xFFBCB0A1),
    300: const Color(0xFFBCB0A1),
    400: const Color(0xFFBCB0A1),
    500: const Color(0xFFBCB0A1),
    600: const Color(0xFFBCB0A1),
    700: const Color(0xFFBCB0A1),
    800: const Color(0xFFBCB0A1),
    900: const Color(0xFFBCB0A1),
  },
);
