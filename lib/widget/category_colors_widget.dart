import 'package:flutter/material.dart';

class CategoryColorsWidget extends StatefulWidget {
  CategoryColorsWidget({Key key}) : super(key: key);

  @override
  CategoryColorsWidgetState createState() => CategoryColorsWidgetState();
}

class CategoryColorsWidgetState extends State<CategoryColorsWidget> {
  List<RadioModel> radioModels = List<RadioModel>();

  @override
  void initState() {
    super.initState();
    radioModels.add(RadioModel(false, Colors.orangeAccent));
    radioModels.add(RadioModel(false, Colors.green));
    radioModels.add(RadioModel(false, Colors.indigoAccent));
    radioModels.add(RadioModel(false, Colors.purple));
    radioModels.add(RadioModel(false, Colors.red));
    radioModels.add(RadioModel(false, Colors.yellow));
    radioModels.add(RadioModel(false, Colors.greenAccent));
    radioModels.add(RadioModel(false, Colors.lightBlue));
    radioModels.add(RadioModel(false, Colors.purpleAccent));
    radioModels.add(RadioModel(false, Colors.redAccent));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
      itemCount: radioModels.length,
      itemBuilder: (BuildContext context, int index) {
        return new InkWell(
          splashColor: Colors.pinkAccent,
          onTap: () {
            setState(() {
              radioModels.forEach((element) => element.isSelected = false);
              radioModels[index].isSelected = true;
            });
          },
          child: new RadioItem(radioModels[index]),
        );
      },
    );
  }

  int get getSelectedColor{
    return radioModels.where((radio) => radio.isSelected).toList().first.color.value;
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      margin: new EdgeInsets.all(12.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            height: 50.0,
            width: 50.0,
            decoration: new BoxDecoration(
              color: _item.color,
              border: new Border.all(
                  width: _item.isSelected ? 4.0 : 0.0,
                  color: _item.isSelected ? Colors.grey : Colors.transparent),
              borderRadius: const BorderRadius.all(const Radius.circular(36.0)),
            ),
          ),
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final Color color;

  RadioModel(this.isSelected, this.color);
}
