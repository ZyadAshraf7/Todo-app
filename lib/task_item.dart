import 'package:flutter/material.dart';
import 'package:untitled/service/database.dart';

class TaskItem extends StatefulWidget {

  final String title,description;
  TaskItem({this.title, this.description});
  @override

  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {

  @override
  bool checkboxListTileValue1=true;


  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(44, 18, 44, 0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
          child: CheckboxListTile(
            value: checkboxListTileValue1??true,
            onChanged: (newValue) =>
                setState(() => checkboxListTileValue1 = newValue),
            title: Text( "title" ,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins'
                )
            ),
            subtitle: Text(
                'description',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins'
                )
            ),
            dense: true,
            controlAffinity: ListTileControlAffinity.trailing,
          ),
        ),
      ),
    );
  }
}
