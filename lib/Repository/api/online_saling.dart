import 'dart:convert';



import 'package:http/http.dart';
import 'package:real_time_product/Repository/model_class/stories_real_time.dart';

import 'api_clint.dart';




class store1 {
  ApiClient apiClient = ApiClient();


  Future<StoriesRealTime> getAnime() async {
    String trendingpath = 'https://real-time-product-search.p.rapidapi.com/search?q=Nike shoes&country=us& language=en';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return StoriesRealTime.fromJson(jsonDecode(response.body));
  }
}