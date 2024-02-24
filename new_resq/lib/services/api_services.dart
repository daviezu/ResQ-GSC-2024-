import 'dart:convert';
import 'package:http/http.dart';
import 'package:new_resq/model/article_model.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=66ad56e936b44dec9c9e2883d2b61d61";

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];

      try {
        List<Article> articles =
            body.map((dynamic item) => Article.fromJson(item)).toList();
        // print('Parsed articles: $articles');
        return articles;
      } catch (e) {
        print('Caught an exception: $e');
        rethrow;
      }
    } else {
      throw ("Can't get the articles");
    }
  }
}
