import 'package:flutter/foundation.dart';

class Filters extends ChangeNotifier {
  Filters({
    required bool isGlutenFree,
    required bool isLactoseFree,
    required bool isVegeterian,
    required bool isVegan,
  })  : _isGlutenFree = isGlutenFree,
        _isLactoseFree = isLactoseFree,
        _isVegeterian = isVegeterian,
        _isVegan = isVegan;

  bool _isGlutenFree;
  bool _isLactoseFree;
  bool _isVegeterian;
  bool _isVegan;

  bool get isGlutenFree => _isGlutenFree;
  bool get isLactoseFree => _isLactoseFree;
  bool get isVegeterian => _isVegeterian;
  bool get isVegan => _isVegan;

  set isGlutenFree(bool value) {
    _isGlutenFree = value;
    notifyListeners();
  }

  set isLactoseFree(bool value) {
    _isLactoseFree = value;
    notifyListeners();
  }

  set isVegeterian(bool value) {
    _isVegeterian = value;
    notifyListeners();
  }

  set isVegan(bool value) {
    _isVegan = value;
    notifyListeners();
  }
}
