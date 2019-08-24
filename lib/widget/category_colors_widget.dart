import 'package:flutter/material.dart';
import 'package:personal_budget/helper/category_colors_helper.dart';
import 'package:personal_budget/models/category.dart';

///Category colors widget
class CategoryColorsWidget extends StatefulWidget {
  ///Category
  final Category category;

  ///Constructor
  CategoryColorsWidget({Key key, this.category}) : super(key: key);

  @override
  CategoryColorsWidgetState createState() => CategoryColorsWidgetState();
}

///Cateogory colors widget state
class CategoryColorsWidgetState extends State<CategoryColorsWidget> {
  ///Radio models
  List<RadioModel> radioModels = <RadioModel>[];

  @override
  void initState() {
    super.initState();
    radioModels.add(RadioModel(isSelected: false, color: Color(0xfff5a623)));
    radioModels.add(RadioModel(isSelected: false, color: Color(0xff3eba65)));
    radioModels.add(RadioModel(isSelected: false, color: Color(0xff4a90e2)));
    radioModels.add(RadioModel(isSelected: false, color: Color(0xffbb37d6)));
    radioModels.add(RadioModel(isSelected: false, color: Color(0xffb83030)));
    radioModels.add(RadioModel(isSelected: false, color: Color(0xffedc100)));
    radioModels.add(RadioModel(isSelected: false, color: Color(0xff7ed321)));
    radioModels.add(RadioModel(isSelected: false, color: Color(0xff4adbe2)));
    radioModels.add(RadioModel(isSelected: false, color: Color(0xffe24a8b)));
    radioModels.add(RadioModel(isSelected: false, color: Color(0xffff5a4b)));

    var category = widget.category;
    if (category != null) {
      CategoryColorsHelper.setSelected(category.color, radioModels);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
      itemCount: radioModels.length,
      itemBuilder: (context, index) {
        return InkWell(
          splashColor: Colors.pinkAccent,
          onTap: () {
            setState(() {
              for (var radio in radioModels) {
                radio.isSelected = false;
              }
              radioModels[index].isSelected = true;
            });
          },
          child: RadioItem(radioModels[index]),
        );
      },
    );
  }

  ///Provides the selected color
  int get getSelectedColor {
    return CategoryColorsHelper.getSelectedColor(radioModels);
  }
}

///Radio item widget
class RadioItem extends StatelessWidget {
  final RadioModel _item;

  ///Constructor
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              color: _item.color,
              border: Border.all(
                  width: _item.isSelected ? 4.0 : 0.0,
                  color: _item.isSelected ? Colors.grey : Colors.transparent),
              borderRadius: const BorderRadius.all(Radius.circular(36.0)),
            ),
          ),
        ],
      ),
    );
  }
}

///Radio model
class RadioModel {
  ///isSelected
  bool isSelected;

  ///color
  final Color color;

  ///Constructor
  RadioModel({this.isSelected, this.color});
}
