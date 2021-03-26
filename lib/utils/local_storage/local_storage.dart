import 'package:get_storage/get_storage.dart';
class LocalStorage {
  //write

  void saveLanguageToDisk(String language) async{
    await GetStorage().write('lang', language);
  }

  // read

  Future<String> get languageSelected async{
    await GetStorage().read('lang');
  }
}