import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final geminiRepositoryProvider = Provider((ref) => GeminiRepository(firestore: ref.watch(firestoreProvider)));

final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);

class GeminiRepository {
  final FirebaseFirestore _firestore;

  GeminiRepository({required FirebaseFirestore firestore}) : _firestore = firestore;

  CollectionReference get _prompt => _firestore.collection("prompt");

  Logger logger = Logger();

  Future<Map<String, dynamic>> getPrompt(String documentId) async {
    try {
      logger.d('documentId: $documentId');
      final snapshot = await _prompt.doc(documentId).get();
      if (snapshot.exists) {
        return snapshot.data() as Map<String, dynamic>;
      } else {
        return {'prompt': 'no prompt'}; // Document not found
      }
    } catch (e) {
      logger.e(e.toString());
      return {'prompt': 'error prompt'}; // Error occurred
    }
  }
}
