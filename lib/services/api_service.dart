import 'dart:convert';
import 'package:toonflix/models/webtoon_detailmodel.dart';
import 'package:http/http.dart';
import 'package:toonflix/models/webtoon_model.dart';// as http;

class ApiService{
 static final String baseUrl ="http://webtoon-crawler.nomadcoders.workers.dev";
 //static final String id="id";
 static final String today = "today";

 static Future<List<WebtoonModel>> getTodaysToons() async{
   List<WebtoonModel> webtoonsInstances =[];
    final targetUrl = Uri.parse('$baseUrl/$today');
    final response = await get(targetUrl);
    if(response.statusCode==200){
      final List<dynamic> webtoons = jsonDecode(response.body);
      for(var webtoon in webtoons){
        webtoonsInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonsInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel>getToonById(String id) async{
   final targetUrl = Uri.parse("$baseUrl/$id");
   final response = await get(targetUrl);

   if(response.body==200){
     final webtoon = jsonDecode(response.body);
     return WebtoonDetailModel.fromJson(webtoon);
   }
   throw Error();
  }
}