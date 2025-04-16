import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

// This will now be injected with FirebaseFirestore automatically from your
// FirebaseInjectableModule.
@lazySingleton
class FirestoreService {
  FirestoreService(this.db) : super();

  final FirebaseFirestore db;

  Future<bool> docExists(String docPath) async {
    final doc = await db.doc(docPath).get();

    return doc.exists;
  }

  Future<DocumentReference<Map<String, dynamic>>> add(
    String collection,
    Map<String, dynamic> data,
  ) {
    return db.collection(collection).add(data);
  }

  Future<void> update(String path, Map<String, dynamic> data) {
    return db.doc(path).update(data);
  }

  Future<void> create(String path, Map<String, dynamic> data) {
    return db.doc(path).set(data);
  }

  Future<void> set(String path, Map<String, dynamic> data) {
    return db.doc(path).set(data, SetOptions(merge: true));
  }

  Future<void> delete(String path, Map<String, dynamic> data) {
    return db.doc(path).delete();
  }
}
