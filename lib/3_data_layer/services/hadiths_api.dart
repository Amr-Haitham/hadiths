import 'package:http/http.dart' as http;

class HadithsAPI {
  final _authority = "hadeethenc.com";
  final _path = "/api/v1/";
  final Map<String, String> _headers = {
    // "api_key": "asd6f84asdf684asd6f4asdf684as6d8f4asd684f",
  };

  Future<http.Response> getAllCategories() async {
    Uri uri =
        Uri.https(_authority, "${_path}categories/list", {"language": "ar"});
    return await http.get(uri, headers: _headers);
  }

//https://hadeethenc.com/api/v1/categories/list/?language=en
  Future<http.Response> getHadithTitlesByCategory(String categoryId) async {
    Uri uri = Uri.https(_authority, "${_path}hadeeths/list/",
        {"language": "ar", "category_id": categoryId});

    return await http.get(uri, headers: _headers);
  }

  Future<http.Response> getSingleHadith(String hadithId) async {
    Uri uri = Uri.https(_authority, "${_path}hadeeths/one/",
        {"id": hadithId, "language": "ar"});

    return await http.get(uri, headers: _headers);
  }
}
