import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/main_screen_tasks.dart';
import 'package:untitled/models/todo_class.dart';
import 'package:untitled/service/database.dart';
import 'package:untitled/task_item.dart';
import 'package:untitled/update_course_screen.dart';

import 'add_task_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DbHelper helper;
  bool checkboxListTileValue1 = true;

  @override
  void initState() {
    super.initState();
    helper = DbHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: Color(0xff373B5E),
        elevation: 8,
        label: InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTaskScreen(),
              ),
            );
          },
          child: Text(
            'Add Task',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16,bottom: 0),
              child: Container(
                width: double.infinity,
                height: 100,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Focus on being productive.",
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 36,
                        color: Color(0xff373B5E),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'BebasNeue',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300].withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 0.5,
                      offset: Offset(0, 0.5), // changes position of shadow
                    ),
                  ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: MainTasksScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
