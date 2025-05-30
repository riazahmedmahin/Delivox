import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:user_app/presentation/Data/responseData.dart';

//****************************** get request ***********************************
class NetworkCaller {
  Future<ResponseData> getRequest(
    String url,
  ) async {
    log(url);
    final Response response = await get(Uri.parse(url),
        headers: {'Content-type': 'application/json'});
    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      final decodeResponse = jsonDecode(response.body);
      if (decodeResponse['msg'] == 'success') {
        return ResponseData(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodeResponse,
        );
      } else {
        return ResponseData(
          isSuccess: false,
          statusCode: response.statusCode,
          responseData: decodeResponse,
          errorMessage: decodeResponse['data'] ?? 'Something went wrong!',
        );
      }
    } else if (response.statusCode == 401) {
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: '',
      );
    } else {
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: '',
      );
    }
  }

//*************************** post request *********************************
  Future<ResponseData> postRequest(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    log(url);
    log(body.toString());
    final Response response = await post(Uri.parse(url),
        body: jsonEncode(body), headers: {'Content-type': 'application/json'});
    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      final decodeResponse = jsonDecode(response.body);
      if (decodeResponse['msg'] == 'success') {
        return ResponseData(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodeResponse,
        );
      } else {
        return ResponseData(
            isSuccess: false,
            statusCode: response.statusCode,
            responseData: decodeResponse,
            errorMessage: decodeResponse['data'] ?? 'Something went wrong!');
      }
    } else if (response.statusCode == 401) {
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: '',
      );
    } else {
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: '',
      );
    }
  }
}