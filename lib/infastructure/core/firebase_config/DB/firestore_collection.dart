import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

//TODO: Add addtnl features and their functions if needed
class FirestoreCollection<T> {
  FirestoreCollection();

  final String path = '';

  // FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference<T> get withConverter => throw UnimplementedError();

  Query<T> orderBy(String field, [bool desc = false]) {
    return withConverter.orderBy(field, descending: desc);
  }

  Future<T?> futureSingleByID(String id) async {
    try {
      return (await withConverter.doc(id).get()).data();
    } catch (err) {
      return null;
    }
  }

  Future<T?> futureSingleWhereEqual(String field, dynamic value) async {
    try {
      final query = withConverter
          .where(field, isEqualTo: value)
          .orderBy('date', descending: true)
          .limit(1);

      return (await query.get()).docs.firstOrNull?.data();
    } catch (err) {
      rethrow;
    }
  }

  Stream<T?> streamSingle(String? id) async* {
    if (id == null) {
      yield* const Stream.empty();
    } else {
      final streamController = StreamController<T?>();

      try {
        withConverter.doc(id).snapshots().listen(
          (snapshot) {
            streamController.add(snapshot.data());
          },
          onError: (Object e, StackTrace stackTrace) {
            streamController
              ..addError(e, stackTrace)
              ..close();
          },
        );
      } catch (e) {
        streamController
          ..addError(e)
          ..close();
      }

      yield* streamController.stream;
    }
  }

  Future<List<T>> futureAll([String? orderBy, bool desc = false]) async {
    final docs = orderBy != null
        ? (await this.orderBy(orderBy, desc).get()).docs
        : (await withConverter.get()).docs;
    // Fetches all documents:
    // •	Optionally ordered by a field (like date, descending).
    // •	Then it maps each doc to a model, like Article, using withConverter.

    return docs.map((doc) => doc.data()).toList();
  }

  Future<List<T>> futureAllWhereEqual(
    String field,
    dynamic value, [
    String? orderBy,
    bool desc = false,
  ]) async {
    try {
      final query = whereEqual(field, value);

      final docs = orderBy != null
          ? (await query.orderBy(orderBy, descending: desc).get()).docs
          : (await query.get()).docs;

      return docs.map((doc) => doc.data()).toList();
    } catch (err) {
      rethrow;
    }
  }

  Query<T> whereEqual(String field, dynamic value) {
    return withConverter.where(field, isEqualTo: value);
  }

  //TODO [optimization]: Connect firestore service somehow and remove FirebaseFirestore from here:
  // Future<void> update(String id, Map<String, dynamic> data) {
  //   return firestoreService.update('$path/$id', data);
  // }
  Future<void> update(String path, Map<String, dynamic> data) {
    final db = FirebaseFirestore.instance;
    return db.doc(path).update(data);
  }
}
