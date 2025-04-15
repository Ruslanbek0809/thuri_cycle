import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

//TODO: Add addtnl features and their functions if needed
class FirestoreCollection<T> {
  FirestoreCollection();

  final String path = '';

  FirebaseFirestore firestore = FirebaseFirestore.instance;

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

  Future<List<T>> futureAll([String? orderBy, bool desc = false]) async {
    final docs = orderBy != null
        ? (await this.orderBy(orderBy, desc).get()).docs
        : (await withConverter.get()).docs;

    return docs.map((doc) => doc.data()).toList();
  }

  Future<List<T>> futureAllWhereEqual(String field, dynamic value,
      [String? orderBy, bool desc = false]) async {
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
}
