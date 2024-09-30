import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  int selectedcategoryIndex = 0;
  bool isLoading = false;
  List categoriesList = ["All"]; //to store categories form api

  Future<void> getCategories() async {
    categoriesList = ["All"];
    isLoading = true;
    notifyListeners();
    final url = Uri.parse("https://fakestoreapi.com/products/categories");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        categoriesList.addAll(jsonDecode(response.body));
        log(categoriesList.toString());
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }

  void onCategorySelection(int index) {
    selectedcategoryIndex = index;
    notifyListeners();
  }

  void getAllProducts() {}

  void getProductsByCategory() {}
}
