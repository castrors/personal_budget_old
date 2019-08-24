import 'package:flutter/material.dart';
import 'package:personal_budget/widget/category_colors_widget.dart';

///Help to get category colors selected
class CategoryColorsHelper {
  ///get selected color
  static int getSelectedColor(List<RadioModel> radioModels) {
    var radio = radioModels.firstWhere((radio) => radio.isSelected,
        orElse: () => RadioModel(color: Colors.white, isSelected: false));
    return radio.color.value;
  }

  /// set the current color selected
  static void setSelected(int selectedColor, List<RadioModel> radioModels) {
    for (var radio in radioModels) {
      if (radio.color.value == selectedColor) {
        radio.isSelected = true;
      }
    }
  }
}
