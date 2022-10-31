import 'package:coffe/controllers/OrdersObject.dart';
import 'package:flutter/cupertino.dart';
import 'DishObject.dart';

class BasketObject with ChangeNotifier {
  List<DishObject> coffePositions = [];
  double total = 0.0;
  int count = 0;

  List<DishObject> packOrder(List<DishObject> coffePositions) {
    List<DishObject> tempCoffe = [];
    for (var coffe in coffePositions) {
      int countIteration = coffe.count;
      for (int i = 0; i < countIteration; i++) {
        coffe.count = 1;
        tempCoffe.add(coffe);
      }
    }
    List<DishObject> newCoffe = [];
    void recurseAlgorithm() {
      if (!tempCoffe.isEmpty) {
        DishObject coffe = tempCoffe.first;
        int count = tempCoffe.where((item) => coffe.compareWith(item)).length;
        print('count $count');
        DishObject myCoffe = coffe.getDeepCopy();
        myCoffe.count = count;
        newCoffe.add(myCoffe);
        tempCoffe.removeWhere((element) => coffe.compareWith(element));
        recurseAlgorithm();
      } else {
        return;
      }
    }

    recurseAlgorithm();
    this.count = newCoffe.length;
    return newCoffe;
  }

  void addCoffe(DishObject coffe) {
    total = 0;
    coffePositions.add(coffe);
    coffePositions = packOrder(coffePositions);
    for (DishObject coffe in coffePositions) {
      total = total + coffe.getTotal();
    }
    notifyListeners();
  }

  void removeCoffe(coffe) {
    coffePositions.remove(coffe);
    count--;
    notifyListeners();
  }

  BasketObject();
}
