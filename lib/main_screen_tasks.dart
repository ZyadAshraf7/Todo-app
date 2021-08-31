import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:untitled/add_task_screen.dart';
import 'package:untitled/service/database.dart';

import 'models/todo_class.dart';
import 'update_course_screen.dart';

class MainTasksScreen extends StatefulWidget {


  @override
  _MainTasksScreenState createState() => _MainTasksScreenState();
}

class _MainTasksScreenState extends State<MainTasksScreen> {

  DbHelper helper;
  bool checkboxListTileValue1 = true;

  @override
  void initState() {
    super.initState();
    helper = DbHelper();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      child:
          FutureBuilder(
            future: helper.displayTodoItems(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              else if(snapshot.data.length==0){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/task.png'),
                    Text("Add Your First Task...",style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ],
                );
              }
              else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    TodoItem todoItem = TodoItem.fromJson(snapshot.data[i]);
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(32, 18, 32, 0),
                          child: Dismissible(
                            key: UniqueKey(),
                            background: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.delete_sweep_outlined,
                                      size: 30,
                                      color: Color(0xff373B5E),
                                    ),
                                    SizedBox(width: 8),
                                    Text("Task will be deleted",style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      color: Color(0xff373B5E),

                                    ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            direction: DismissDirection.endToStart,
                            confirmDismiss: (direction) {
                              return showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: Text('Are you sure?'),
                                  content: Text(
                                    'Do you want to delete this task?',
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('No'),
                                      onPressed: () {
                                        Navigator.of(ctx).pop(false);
                                      },
                                    ),
                                    TextButton(
                                      child: Text('Yes'),
                                      onPressed: () {
                                        Navigator.of(ctx).pop(true);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                            onDismissed: (direction) {
                              setState(() {
                                 helper.deleteTodoItem(todoItem.id);
                              });
                            },
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UpdateTodoItemScreen(todoItem),
                                  ),
                                );
                              },
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Colors.white,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                                  child: ListTile(
                                    title: Text("${todoItem.title}",
                                        style: TextStyle(
                                            decoration: todoItem.isDone == 1
                                                ? TextDecoration.lineThrough
                                                : null,
                                            fontSize: 20,
                                            fontFamily: 'Poppins')),
                                    subtitle: Text(
                                        '${todoItem.description == null ? "" : todoItem.description}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Poppins')),
                                    trailing: CustomCheckBox(
                                        checkBoxSize: 22,
                                        borderRadius: 25,
                                        shouldShowBorder: true,
                                        borderColor: Colors.blueAccent ,
                                        //borderWidth: 2,
                                        checkedFillColor: Colors.blueAccent,
                                        value: todoItem.isDone == 1
                                            ? true
                                            : false,
                                        onChanged: (value) {
                                          setState(() {
                                            todoItem.isDone = value ? 1 : 0;
                                            helper.updateTodoItem(todoItem);
                                          });
                                        }),

                                    dense: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            },
          ),

    );
  }
}
