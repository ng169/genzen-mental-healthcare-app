Future<bool> checkIfDocExists(String docId, var collectionRef) async {
  try {
    // Get reference to Firestore collection

    var doc = await collectionRef.doc(docId).get();
    return doc.exists;
  } catch (e) {
    rethrow;
  }
}
