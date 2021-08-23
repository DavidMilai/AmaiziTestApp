import '../config.dart';
import 'dio_api.dart';

class Api extends DioApi {
  Api() : super(Config.apiUrl);

  Future getUsers() async {
    return dio.get('/users');
  }

  Future getLanguages() async {
    return dio.get('/locale');
  }
}

Api api = Api();
