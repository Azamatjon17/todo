import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo/models/note_model.dart';

class NoteController {
  List<Note> _list = [];
  List<Note> get list => [..._list];

  Future<List<Note>> getNotes() async {
    List<Note> notes = [];
    final response = await http.get(
      Uri.parse('https://todo-2a867-default-rtdb.firebaseio.com/notes.json'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic>? json = jsonDecode(response.body);

      if (json != null) {
        json.forEach((String key, dynamic value) {
          print(key);
          notes.add(Note.fromJson(key, value));
        });
      }
    } else {
      throw Exception('Failed to load notes');
    }

    _list = notes;
    return _list;
  }

  Future<void> editNote(Note note) async {
    final url = 'https://todo-2a867-default-rtdb.firebaseio.com/notes/${note.id}.json';
    final response = await http.put(
      Uri.parse(url),
      body: json.encode(note.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update note');
    }
  }

  Future<void> deleteNote(Note note) async {
    final url = 'https://todo-2a867-default-rtdb.firebaseio.com/notes/${note.id}.json';
    final response = await http.delete(
      Uri.parse(url),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete note');
    }
  }

  Future<void> addNote(Note note) async {
    const url = 'https://todo-2a867-default-rtdb.firebaseio.com/notes.json';
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(note.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to add note');
    }
  }
}
