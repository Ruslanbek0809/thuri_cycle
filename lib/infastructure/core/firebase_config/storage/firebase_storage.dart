import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseStorageService {
  FirebaseStorageService(this._firebaseStorage);

  final FirebaseStorage _firebaseStorage;

  Future<String> uploadImage({
    required File file,
    required String path,
    Function(double)? onUploadProgress,
  }) async {
    final storageReference = FirebaseStorage.instance.ref().child(path);
    final uploadTask = storageReference.putFile(
      file,
      SettableMetadata(contentType: 'image/jpg'),
    );
    late String downloadUrl;

    uploadTask.snapshotEvents.listen((event) async {
      final progress =
          event.bytesTransferred.toDouble() / event.totalBytes.toDouble();
      onUploadProgress?.call(progress);
    });

    final taskSnapshot = await uploadTask;

    if (taskSnapshot.state == TaskState.success) {
      // downloadUrl = await storageReference.getDownloadURL();

      // To fix file path issue when uploading & retrieving firebase storage issue
      downloadUrl = path;
    }

    return downloadUrl;
  }

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
      return _firebaseStorage
          .ref('thumbnails/kw-not-found.jpg')
          .getDownloadURL();
    }
  }
}
