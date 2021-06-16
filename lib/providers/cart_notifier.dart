import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CartNumber  extends ChangeNotifier{
  int number;
  addCart(int  num){
    number = num;
    notifyListeners();
  }

  updateCart(){
    number = number+1;
    notifyListeners();

  }
  clearCart(){
    number = 0;
    notifyListeners();
  }

}