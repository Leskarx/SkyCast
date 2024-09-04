import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
void main() async{
  const api="https://api.openweathermap.org/data/2.5/weather?q=Jorhat&APPID=ec80bfbf062a396b619cec6dab1d9d3c";
  // main api call

  // https://api.openweathermap.org/data/2.5/forecast/?q=Jorhat&APPID=ec80bfbf062a396b619cec6dab1d9d3c
  // houlry forecast and weekly 






Future fetchData() async{
  var response=await http.get(Uri.parse(api));
  var data=jsonDecode(response.body);
return data;
}
var data=await fetchData();
print(data['main']['temp']);
}


