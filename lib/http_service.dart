import 'dart:async';
import 'package:http/http.dart' ;
import 'dart:convert';
import 'student_modal.dart';
class Httpservice{
  var presentDate=DateTime.now().toString().substring(0, 16);
  List<LiveSessions> sessionList=List.empty(growable: true);
 Future<List<LiveSessions>>fetchsession() async {
    Response response =await get(Uri.parse('student.json.odt'));
  if(response.statusCode==200){
    dynamic body=jsonDecode(response.body);
    if(body!=null){
      List<dynamic> finalres=body;
      // print(finalres[1]['id']);
      for(var i in finalres){
        if(DateTime.parse(presentDate).isAfter(i['start_time']) & DateTime.parse(presentDate).isBefore(i['end_time'])){
          i['session_link']='session is ongoing';
          // i['id']=0;
          // sessionList.add(LiveSessions.parseResponse(i));  
      }
      else if(DateTime.parse(presentDate).isBefore(i['start_time'])){
        i['session_link']='session is not yet started';
      }
      else if(DateTime.parse(presentDate).isAfter(i['end_time'])){
        i['session_link']='Session completed';
      }
      sessionList.add(LiveSessions.parseResponse(i)); 
      }
     return sessionList;
    }
    
    return sessionList;
}
else{
return sessionList;
}
 }

}

// import 'dart:async';
// import 'package:http/http.dart' ;
// import 'dart:convert';
// class Httpservice{
//   List<Post> postlist=List.empty(growable: true);
//  Future<List<Post>> fetchPost() async {
//     Response response =
//     await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//   if(response.statusCode==200){
//     dynamic body=jsonDecode(response.body);
//     if(body!=null){
//       List<dynamic> finalres=body;
//       // print(finalres[1]['id']);
//       for(var i in finalres){
//         if(i['id']%2==0){
//           // i['id']=0;
//           postlist.add(Post.parseResponse(i));  
        
//       }
//       }
//      return postlist;
//     }
    
//     return postlist;
// }
// else{
// return postlist;
// }
//  }
// }


// class Post{
//   int userId;
//   int id;
//   String title;
//   String body;
//   Post({required this.userId,required this.id,required this.title,required this.body});

// factory Post.parseResponse(dynamic data)
// {    return Post(
//         id: int.parse(data['id'].toString()),
//         title: data['title'],
//         body: data['body'],
//         userId: int.parse(data['userId'].toString()),
//     );
//   }
// }
