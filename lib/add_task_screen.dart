import 'package:flutter/material.dart';
import 'package:untitled/home_page.dart';
import 'package:untitled/models/todo_class.dart';
import 'package:untitled/service/database.dart';

class AddTaskScreen extends StatefulWidget {

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  String  title,description;
  int  isDone;
  DbHelper  helper;
  @override
  void initState() {
    super.initState();
     helper=DbHelper();
  }

  GlobalKey<FormState>formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xff373B5E)),
        ),
        body: Align(
          alignment: Alignment(0, 0),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Form(
              key: formKey,
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
                            color: Color(0xff373B5E),
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
                                color: Color(0xff373B5E),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(16, 5, 16, 5),
                              child: TextFormField(

                                validator: (value){
                                  if(value.isEmpty){
                                    return 'Please add a task';
                                  }
                                  return null;
                                },
                                onChanged:(value){
                                  setState(() {
                                    title=value;
                                  });
                                },
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
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Montserrat',
                                  color: Color(0xff373B5E),
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
                                color: Color(0xff373B5E),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                              child: TextFormField(
                                onChanged:(value){
                                  setState(() {
                                    description=value;
                                  });
                                } ,
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
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
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
                                  color: Color(0xff373B5E),
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
                  Align(
                    alignment: Alignment(0.95, 0),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color(0xff373B5E)) ,
                        ),
                        onPressed: () async {
                          if(!formKey.currentState.validate()){
                            return;
                          }
                          TodoItem todoItem = TodoItem({'title':title,'description':description,'isDone':isDone=0},);
                           int id = await helper.createTodoItem(todoItem);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen())).then((value) {
                            setState(() {

                            });
                          });
                        },
                        child: Text(
                          "Add",
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
      ),
    );
  }
}
