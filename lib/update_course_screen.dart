import 'package:flutter/material.dart';
import 'package:untitled/models/todo_class.dart';
import 'package:untitled/service/database.dart';

class UpdateTodoItemScreen extends StatefulWidget {

  TodoItem todoItem;
  UpdateTodoItemScreen(this.todoItem);

  @override
  _UpdateTodoItemScreenState createState() => _UpdateTodoItemScreenState();
}
class _UpdateTodoItemScreenState extends State<UpdateTodoItemScreen> {


  TextEditingController teTitle = TextEditingController();
  TextEditingController teDescription = TextEditingController();
  DbHelper dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
    teTitle.text=widget.todoItem.title;
    teDescription.text=widget.todoItem.description;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF4F6FD),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Align(
          alignment: Alignment(0, 0),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Add a task',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          color: Color(0xFF0D1724),
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: 330,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color(0xFFE6E6E6),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                            child: TextFormField(
                              controller: teTitle,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Task',
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: Color(0xFF8B97A2),
                                  fontWeight: FontWeight.w500,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Montserrat',
                                color: Color(0xFF8B97A2),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: 330,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color(0xFFE6E6E6),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                            child: TextFormField(
                              controller: teDescription,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Task description (optional)',
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: Color(0xFF8B97A2),
                                  fontWeight: FontWeight.w500,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color(0xFF8B97A2),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0.95, 0),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: ElevatedButton(
                      onPressed: () async {
                        var updatedTodoItem = TodoItem({
                          'id': widget.todoItem.id,
                          'title':teTitle.text,
                          'description':teDescription.text,
                          'isDone':widget.todoItem.isDone,
                        });
                        await dbHelper.updateTodoItem(updatedTodoItem);
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
