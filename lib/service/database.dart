
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:untitled/models/todo_class.dart';

class DbHelper{

    static final DbHelper _instance=DbHelper.internal();
    factory DbHelper() => _instance;
    DbHelper.internal();

    static Database  database;
    createDatabase() async{
      if(database!=null){
        return database;
      }
      var path = join(await getDatabasesPath(),'todo.db');
      database = await openDatabase(path,version: 1,onCreate: (Database db, int version){
         db.execute('CREATE TABLE todo (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, isDone INTEGER)');
      });
      return database;
    }

    // add todo item in database
    Future<int>createTodoItem(TodoItem todoItem)async{
      Database db = await createDatabase();
      return db.insert('todo', todoItem.todoMap());
    }
    // delete todo item in database
    Future<int> deleteTodoItem(int id)async{
      Database db = await createDatabase();
      return db.delete('todo',where:'id = ?',whereArgs: [id]);
    }
    // display every todo item in database
    Future<List> displayTodoItems()async{
      Database db = await createDatabase();
      return db.query('todo');

    }

    Future<int> updateTodoItem(TodoItem todoItem)async{
      Database db = await createDatabase();
      return await db.update('todo', todoItem.todoMap(),where: 'id = ?',whereArgs: [todoItem.id]);
    }
    toggleTodoItem(TodoItem todoItem)async{
      Database db = await createDatabase();
      return await db.update('todo', todoItem.todoMap(),where: 'isDone = ?',whereArgs: [todoItem.isDone]);
    }


}