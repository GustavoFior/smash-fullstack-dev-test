import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseFirestoreRepository {
  Future<QuerySnapshot<Map<String, dynamic>>> getCollection(String collection);
  Future<DocumentReference<Map<String, dynamic>>> getDocument(
      String collection, String id);
}
