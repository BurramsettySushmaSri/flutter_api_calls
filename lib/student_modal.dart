class LiveSessions{
  int session_id;
  String session_name;
  String session_link;
 DateTime start_time;
  DateTime end_time;
LiveSessions({required this.session_id,required this.session_name,required this.session_link,required this.start_time,required this.end_time});
factory LiveSessions.parseResponse(dynamic data){
  return LiveSessions(
    session_id: data['sesion_id'],
    session_name: data['session_name'],
    session_link: data['session_link'],
    start_time: DateTime.parse(data['start_time']),
    end_time: DateTime.parse(data['end_time'].toString()),
  );
}
}