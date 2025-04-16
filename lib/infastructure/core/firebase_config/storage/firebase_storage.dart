import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseStorageService {
  FirebaseStorageService(this._firebaseStorage);

  final FirebaseStorage _firebaseStorage;

  Future<String> getImageUrl(String? imagePath) async {
    if (imagePath == null) {
      return '';
    }

    try {
      final storageReference = imagePath.contains('gs://')
          ? _firebaseStorage.refFromURL(imagePath)
          : _firebaseStorage.ref(imagePath);
      return await storageReference.getDownloadURL();
    } catch (e) {
      return _firebaseStorage.ref('thumbnails/kw-not-found.jpg').getDownloadURL();
    }
  }
}
 