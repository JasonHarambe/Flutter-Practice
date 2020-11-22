import 'package:flutter/material.dart';
import 'package:noteapp/inherited_widgets/note_inherited_widget.dart';
import 'package:noteapp/views/note_list.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NoteInheritedWidget(
      MaterialApp(
        title: 'Notes',
        home: NoteList(),
      ),
    );
  }
}
