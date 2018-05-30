import 'dart:async';
import 'dart:convert';

import 'dart:io';

class Dog {
  final String name;
  final String loc;
  final String desc;
  String imageUrl;
  int rating= 100;

  Dog(this.name, this.loc, this.desc);

  Future getImageUrl() async {
    // image null check
    if (imageUrl!=null){
      return;
    }

    // define httpclient
    HttpClient httpClient = new HttpClient();
    try{
      var uri = new Uri.http('dog.ceo', '/api/breeds/image/random');
      var request = await httpClient.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(UTF8.decoder).join();
      var json = JSON.decode(responseBody);

      var url = json['message'];
      imageUrl = url;
    }catch(exception){
      print(exception);
    }
  }

}