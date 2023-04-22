import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  getNotes() async {
    CollectionReference notesReference =
        FirebaseFirestore.instance.collection("notas");
    QuerySnapshot collection = await notesReference.get();
    List<QueryDocumentSnapshot> docs = collection.docs;
    List<Map> notes = [];
    for (var item in docs) {
      Map note = item.data() as Map;
      note["id"] = item.id;
      notes.add(note);
    }
    return notes;
  }

  void updateNote(String id) {
    CollectionReference notesReference =
        FirebaseFirestore.instance.collection("notas");

    notesReference.doc(id).update({
      "status": true,
    });
  }
}
