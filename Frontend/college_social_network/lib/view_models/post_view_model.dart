import 'dart:convert';
import 'dart:html';
import 'dart:io';

import 'package:ConnectUs/models/postModel.dart';
import 'package:ConnectUs/utils/constants.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class PostViewModel with ChangeNotifier {
  List<Post> posts = [];

  Future<void> getAllPosts() async {
    Uri uri = Uri.parse(server + "posts");
    var response = await http.get(uri);
    var responseBody = json.decode(response.body);
    List<Post> temp = [];
    var resposts = responseBody['posts'] as List<dynamic>;
    resposts.forEach((element) {
      var post = Post.fromJson(element);
      print(post.likeCount);
      temp.add(post);
    });
    posts = temp;
    notifyListeners();
  }

  Future<void> addNewPost(String text, List<CloudinaryResponse> images) async {
    Uri uri = Uri.parse(server + "posts/");
    List<String> postImages = images.map((image) => image.secureUrl).toList();

    var request = http.MultipartRequest('POST', uri)
      ..fields['text'] = text
      ..fields['timeStamp'] = DateTime.now().toIso8601String()
      ..fields['userName'] = "Khushboo Arora"
      ..fields['images'];

    var response = await request.send();
    print(response.reasonPhrase);
  }
}
