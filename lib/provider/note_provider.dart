import 'package:codigo6_states/services/remote/firestore_service.dart';
import 'package:flutter/cupertino.dart';

class NoteProvider extends ChangeNotifier {
  FirestoreService firestoreService = FirestoreService();

  List<Map> notes = [];
  getNotes() async {
    notes = await firestoreService.getNotes();
    notifyListeners();
  }

  updateNotes(String id) {
    firestoreService.updateNote(id);
    getNotes();
    notifyListeners();
  }
}
