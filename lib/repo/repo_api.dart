import 'package:Youtube_Spam/model/multi_predict.dart';
import 'package:dio/dio.dart';
import 'package:Youtube_Spam/model/result.dart';
import 'dart:async';
class ApiRepo{
  final String urlApi;
  ApiRepo({this.urlApi});

  Future<int> getTest() async{
    Response response = await Dio().get(urlApi);
    return response.statusCode;
  }
  Future<Multi> getMultiPredict(String method, int id) async{
    Response response = await Dio().post(urlApi+"/multipredict",
      data: {
        "method":method,
        "id": id
      }
    );
    Multi multi = multiFromJson(response.toString());
    print(multi);
    return multi;
  }
  Future<Result> getResultNP(String data) async{
    Response response = await Dio().post(urlApi+"/np",
        data: {
          "DATA": data
        }
    );
    print(response.data.toString());
    Result result = resultFromJson(response.toString());
    return result;
  }
  Future<Result> getResultSVM(String data) async{
    Response response = await Dio().post(urlApi+"/svm",
        data: {
          "DATA": data
        }
    );
    print(response.data.toString());
    Result result = resultFromJson(response.toString());
    return result;
  }

  Future<Result> getResultLSMT(String data) async{
    Response response = await Dio().post(urlApi+"/lstm",
        data: {
          "DATA": data
        }
    );
    print(response.data.toString());
    Result result = resultFromJson(response.toString());
    return result;
  }
}