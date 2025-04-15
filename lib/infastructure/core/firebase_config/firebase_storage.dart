import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  FirebaseStorageService._();

  static final instance = FirebaseStorageService._();

  Future<String> getImageUrl(String? imagePath) async {
    final storage = FirebaseStorage.instance;
    if (imagePath == null) {
      return '';
    }

    try {
      final storageReference = imagePath.contains('gs://')
          ? storage.refFromURL(imagePath)
          : storage.ref(imagePath);
      return await storageReference.getDownloadURL();
    } catch (e) {
      return storage.ref('thumbnails/kw-not-found.jpg').getDownloadURL();
    }
  }
}
