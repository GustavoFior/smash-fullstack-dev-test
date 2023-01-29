import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smash_app/app/commons/commons.dart';

class FirebaseFirestoreRepositoryImpl implements FirebaseFirestoreRepository {
  final FirebaseFirestore firestore;

  FirebaseFirestoreRepositoryImpl({
    required this.firestore,
  });

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getCollection(
      String collection) async {
    return await firestore.collection(collection).get();
  }

  @override
  Future<DocumentReference<Map<String, dynamic>>> getDocument(
      String collection, String id) async {
    return firestore.collection(collection).doc(id);
  }
}
