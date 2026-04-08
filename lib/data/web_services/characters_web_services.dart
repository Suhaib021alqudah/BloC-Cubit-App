import 'package:dio/dio.dart';
import 'package:rickandmorbloc/core/constants/strings.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: Strings.baseUrl, // تأكد أنها https://rickandmortyapi.com/api/
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<dynamic> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      return response.data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
