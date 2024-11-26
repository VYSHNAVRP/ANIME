import 'dart:convert';


import 'package:http/http.dart';


import '../API/Api_client.dart';
import '../Model_class/Anime_Model.dart';






class AnimeApi {
  ApiClient apiClient = ApiClient();


  Future<Anime> getAnime() async {
    String trendingpath = 'https://anime-db.p.rapidapi.com/anime?page=1&size=10&search=Fullmetal&genres=Fantasy%2CDrama&sortBy=ranking&sortOrder=asc';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return Anime.fromJson(jsonDecode(response.body));
  }
}