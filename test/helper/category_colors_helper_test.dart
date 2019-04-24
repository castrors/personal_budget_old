import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:personal_budget/helper/category_colors_helper.dart';
import 'package:personal_budget/widget/category_colors_widget.dart';
import "package:test/test.dart";

void main() {
  test(
      "given category colors widget when there is no selection then  getColorSelected should return color white value",
      () {
    var selectedColorValue = CategoryColorsHelper.getSelectedColor(provideRadioModels());
    expect(selectedColorValue, equals(Colors.white.value));
  });

  test(
      "given category colors widget when first is selected then getColorSelected should return Color(0xfff5a623)",
      () {

    var radioModelList = provideRadioModels();
    CategoryColorsHelper.setSelected(Color(0xfff5a623).value, radioModelList);
    var selectedColorValue = CategoryColorsHelper.getSelectedColor(radioModelList);
    expect(selectedColorValue, equals(Color(0xfff5a623).value));
  });
}

List<RadioModel> provideRadioModels() {
  return [
    RadioModel(isSelected: false, color: Color(0xfff5a623)),
    RadioModel(isSelected: false, color: Color(0xff3eba65)),
    RadioModel(isSelected: false, color: Color(0xff4a90e2)),
    RadioModel(isSelected: false, color: Color(0xffbb37d6)),
    RadioModel(isSelected: false, color: Color(0xffb83030)),
    RadioModel(isSelected: false, color: Color(0xffedc100)),
    RadioModel(isSelected: false, color: Color(0xff7ed321)),
    RadioModel(isSelected: false, color: Color(0xff4adbe2)),
    RadioModel(isSelected: false, color: Color(0xffe24a8b)),
    RadioModel(isSelected: false, color: Color(0xffff5a4b))
  ];
}