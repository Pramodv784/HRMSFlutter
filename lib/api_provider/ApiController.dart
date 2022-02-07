


import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hrms/utility/Utility.dart';

import '../feedback_dashboard/model/avg_month_response.dart';
import '../main.dart';






/// 🔥 MVP Architecture🔥
/// 🍴 Focused on Clean Architecture
/// Created by 🔱 Pratik Kataria 🔱 on 12-08-2021.

class ApiController {
  var tag = "ApiController";
  static ApiController _instance = ApiController.internal();

  ApiController.internal();

  factory ApiController() {
    return _instance;
  }

  static ApiController getInstance() {
    if (_instance == null) {
      _instance = ApiController.internal();
    }
    return _instance;
  }

  Future<Response> post(String url, {Map headers, body, encoding, payload}) async {
    Map<String, String> headersMap = headers ?? {};
    headersMap["NoEncryption"] = 'true';
    Utility.log(tag, "Api Call :\n $url \n --> Inputs :\n $body \n --> payload :\n ${payload.toString()} \n --> header :\n $headers");
    Response response = await dio.post(
      url,
      data: body,
      queryParameters: payload,
      options: Options(
        contentType: ContentType.json.toString(),
        receiveTimeout: 300000,
        sendTimeout: 300000,
        method: "POST",
        headers: headersMap,
      ),
    );

    Utility.log(tag, response.toString());
    return response;
  }

  Future<Response> postV2(String url, {Map text, encoding, payload, String body}) async {
    Map<String, String> headersMap = text ?? {};
    headersMap["NoEncryption"] = 'true';
    Utility.log(tag,
        "Api Call :\n $url \n --> Inputs :\n ${body.toString()} \n --> payload :\n ${payload.toString()} \n --> header :\n ${text.toString()}");
    Response response = await dio.post(
      url,
      data: body,
      queryParameters: payload,
      options: Options(
        contentType: ContentType.json.toString(),
        receiveTimeout: 300000,
        sendTimeout: 300000,
        method: "POST",
        headers: headersMap,
      ),
    );

    Utility.log(tag, response.toString());
    return response;
  }

  Future<Response> put(String url, { Map headers, body, encoding, payload}) async {
    Map<String, String> headersMap = headers ?? {};
    headersMap["NoEncryption"] = 'true';
    Utility.log(tag,
        "Api Call :\n $url \n --> Inputs :\n ${body.toString()} \n --> payload :\n ${payload.toString()} \n --> header :\n ${headers.toString()}");
    Response response = await dio.put(
      url,
      data: body,
      queryParameters: payload,
      options: Options(
        contentType: ContentType.json.toString(),
        receiveTimeout: 300000,
        sendTimeout: 300000,
        method: "PUT",
        headers: headersMap,
      ),
    );

    Utility.log(tag, response.toString());
    return response;
  }
  Future<Response> patch(String url, {Map headers, body, encoding, payload}) async {
    Map<String, String> headersMap = headers ?? {};
     headersMap["NoEncryption"] = 'true';
    Utility.log(tag, "Api Call :\n $url \n --> Inputs :\n ${body.toString()} \n --> payload :\n ${payload.toString()} \n --> header :\n ${headers.toString()}");
    Response response = await dio.patch(
      url,
      data: body,
      queryParameters: payload,
      options: Options(
        contentType: ContentType.json.toString(),
        receiveTimeout: 300000,
        sendTimeout: 300000,
        method: "PATCH",
        headers: headersMap,
      ),
    );

    Utility.log(tag, response.toString());
    return response;
  }
  Future<Response> get2(String url,
      {Map headers, body, encoding, payload}) async {
    Map<String, String> headerMap = headers ?? {};
    headerMap["NoEncryption"] = 'true';
    Utility.log(tag, "Api Call :\n $url \n Inputs :\n ${body
        .toString()} \n Payload :\n ${payload}  \n Header :\n $headers");

    Response response = await dio.get(url,
        queryParameters: payload,
        options: Options(
          contentType: ContentType.json.toString(),
          receiveTimeout: 300000,
          sendTimeout: 300000,
          method: "GET",
          headers: headerMap,
        ));

    Utility.log(tag, response.toString());
    return response;
  }
  Future<List<Response>> getList(String url,
      {Map headers, body, encoding, payload}) async {
    Map<String, String> headerMap = headers ?? {};
    headerMap["NoEncryption"] = 'true';
    Utility.log(tag, "Api Call :\n $url \n Inputs :\n ${body
        .toString()} \n Payload :\n ${payload}  \n Header :\n $headers");

    Response response = await dio.get(url,
        queryParameters: payload,
        options: Options(
          contentType: ContentType.json.toString(),
          receiveTimeout: 300000,
          sendTimeout: 300000,
          method: "GET",
          headers: headerMap,
        ));

    Utility.log(tag, response.toString());
    return (response.data as List);
  }




  Future<Response> get(String url, { headers}) async {
   // Map<String, String> headerMap = headers ?? {};
    //headerMap["NoEncryption"] = 'true';
    Utility.log(tag, "Api Call :\n $url \n Inputs :\n Payload : \n Header :\n $headers");

    Response response = await dio.get(url,
        options: Options(
            contentType: ContentType.json.toString(),
            receiveTimeout: 300000,
            sendTimeout: 300000,
            method: "GET",
           // headers: headerMap
        ));

    Utility.log(tag, response.toString());
    return response;
  }
  Future<Response> delete(String url,
      {Map headers, body, encoding, payload}) async {
    Map<String, String> headerMap = headers ?? {};
    Utility.log(tag,
        "Api Call :\n $url \n Inputs :\n ${body
            .toString()} \n Payload :\n ${payload} \n Headers :\n ${headerMap} ");

    Response response = await dio.deleteUri(Uri.parse(url),
        data: body,
        options: Options(
          contentType: ContentType.json.toString(),
          receiveTimeout: 300000,
          sendTimeout: 300000,
          method: "DELETE",
          headers: headerMap,
        ));

    Utility.log(tag, response.toString());
    return response;
  }

}