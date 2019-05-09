import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'dart:convert';

class StationData extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _StationData();
  }
}
class _StationData extends State<StationData>{
  String stateText = '点击按钮';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('$stateText'),
              onPressed: () {
                showPickerModal(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void showPicker(BuildContext context) {
    Picker picker = new Picker(
      adapter: PickerDataAdapter<String>(pickerdata: ["设备正常", "设备断电", "设备损坏"]),
      changeToFirst: true,
      textAlign: TextAlign.left,
      columnPadding: const EdgeInsets.all(8.0),
      onConfirm: (Picker picker, List value) {
        print(value.toString());
        print(picker.getSelectedValues());
      }
    );
    picker.show(_scaffoldKey.currentState);
  }

  void showPickerModal(BuildContext context) {
    new Picker(
      adapter: PickerDataAdapter<String>(pickerdata: ["设备正常", "设备断电", "设备损坏"]),
      changeToFirst: true,
      hideHeader: false,
      onConfirm: (Picker picker, List value) {
        print(value.toString());
        print(picker.adapter.text);
      }
    ).showModal(this.context);
  }

  void showPickerDialog(BuildContext context) {
    new Picker(
        adapter: PickerDataAdapter<String>(pickerdata: ["设备正常", "设备断电", "设备损坏"]),
        hideHeader: true,
        title: new Text("选择日期"),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }
    ).showDialog(context);
  }

  void showPickerDateTime24(BuildContext context) {
    print(_scaffoldKey.currentState);
    new Picker(
      adapter: new DateTimePickerAdapter(
          type: PickerDateTimeType.kYMDHM,
          isNumberMonth: true,
          yearSuffix: "年",
          monthSuffix: "月",
          daySuffix: "日"
      ),
      title: new Text("选择日期"),
      onConfirm: (Picker picker, List value) {
        print(picker.adapter.text);
      },
      onSelect: (Picker picker, int index, List<int> selecteds) {
        this.setState(() {
          stateText = picker.adapter.toString();
        });
      }
    ).show(_scaffoldKey.currentState);
  }

  void showPickerArray(BuildContext context) {
    new Picker(
        // adapter: PickerDataAdapter<String>(pickerdata: new JsonDecoder().convert(PickerData2), isArray: true),
        adapter: PickerDataAdapter<String>(pickerdata: ["设备正常", "设备断电", "设备损坏"], isArray: true),
        hideHeader: true,
        title: new Text("Please Select"),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }
    ).showDialog(context);
  }
}
