class TodoItem {
   int id;
   String title;
   String description;
   int isDone;

  TodoItem(dynamic obj){
    id = obj['id'];
    title=obj['title'];
    description=obj['description'];
    isDone=obj['isDone'];

  }
  TodoItem.fromJson(Map<String,dynamic>data){
    id = data['id'];
    title=data['title'];
    description=data['description'];
    isDone=data['isDone'];
  }

  todoMap(){

    var map = Map<String,dynamic>();
    map['id']=id;
    map['title']=title;
    map['description']=description;
    map['isDone']=isDone;

    return map;
  }

}
