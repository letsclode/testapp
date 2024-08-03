import 'package:my_app/app/provider/local_storage_provider.dart';

class CameraRepository {
  CameraRepository({required this.localStorageProvider});

  final LocalStorageProvider localStorageProvider;

  Future<bool> saveImage({required String imagePath}) async {
    try {
      List<String> currentList = await localStorageProvider.getList();
      await localStorageProvider.saveList([...currentList, imagePath]);
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<List<String>> getAll() async {
    List<String> currentList = await localStorageProvider.getList();
    return currentList;
  }
}
