import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:consume_api/models/post.dart';
import 'package:consume_api/utils/endpoint.dart';
import 'package:consume_api/utils/request_helper.dart';

class PostService {
  Future<http.Response> fetch() async {
    String endPoint = EndPoint.post;
    Uri url = Uri.parse(endPoint);
    return await http.get(url, headers: RequestHelper.basicHeader());
  }

  Future<http.Response> fetchComments(int id) async {
    String endPoint = "${EndPoint.post}/$id/comments";
    Uri url = Uri.parse(endPoint);

    return await http.get(
      url,
      headers: RequestHelper.basicHeader(),
    );
  }

  Future<http.Response> fetchAlbums(int id) async {
    String endPoint = "${EndPoint.post}/$id/albums";
    Uri url = Uri.parse(endPoint);

    return await http.get(url, headers: RequestHelper.basicHeader());
  }

  Future<http.Response> fetchPhotos(int id) async {
    final endPoint = "${EndPoint.post}/$id/photos";
    final url = Uri.parse(endPoint);

    return await http.get(url, headers: RequestHelper.basicHeader());
  }

  Future<http.Response> create(Post post) async {
    String endPoint = EndPoint.post;
    Uri url = Uri.parse(endPoint);
    var jsonBody = post.toMap();

    return await http.post(
      url,
      body: jsonEncode(jsonBody),
      headers: RequestHelper.basicHeader(),
    );
  }

  Future<http.Response> put(Post post) async {
    String endPoint = "${EndPoint.post}/${post.id}";
    Uri url = Uri.parse(endPoint);
    var jsonBody = post.toMap();

    return await http.put(
      url,
      body: jsonEncode(jsonBody),
      headers: RequestHelper.basicHeader(),
    );
  }

  Future<http.Response> patch({
    required int id,
    String? title,
    String? body,
  }) async {
    String endPoint = "${EndPoint.post}/$id";
    Uri url = Uri.parse(endPoint);

    Map<String, dynamic> jsonBody = {};
    if (title != null) {
      jsonBody["title"] = title;
    }
    if (body != null) {
      jsonBody["body"] = body;
    }

    return await http.patch(
      url,
      body: jsonEncode(jsonBody),
      headers: RequestHelper.basicHeader(),
    );
  }

  Future<http.Response> delete(int id) async {
    String endPoint = "${EndPoint.post}/$id";
    Uri url = Uri.parse(endPoint);

    return await http.delete(
      url,
      headers: RequestHelper.basicHeader(),
    );
  }
}