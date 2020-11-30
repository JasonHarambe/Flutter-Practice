import 'package:flutter/material.dart';
import 'package:noteapp/providers/note_provider.dart';

enum NoteMode { Editing, Adding }

class Note extends StatefulWidget {
  final NoteMode noteMode;
  final Map<String, dynamic> note;

  Note(this.noteMode, {this.note});

  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  @override
  void didChangeDependencies() {
    if (widget.noteMode == NoteMode.Editing) {
      _titleController.text = widget.note['title'];
      _textController.text = widget.note['text'];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.noteMode == NoteMode.Adding ? 'Add Note' : 'Edit Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: 'Note Title'),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _textController,
              decoration: InputDecoration(hintText: 'Note Body'),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _NoteButton('Save', Colors.red, () {
                  final title = _titleController.text;
                  final text = _textController.text;

                  if (widget?.noteMode == NoteMode.Adding) {
                    NoteProvider.insertNote({
                      'title': title,
                      'text': text,
                    });
                  } else if (widget?.noteMode == NoteMode.Editing) {
                    NoteProvider.updateNote({
                      'id': widget.note['id'],
                      'title': title,
                      'text': text,
                    });
                  }
                  Navigator.pop(context);
                }),
                _NoteButton('Discard', Colors.blueAccent, () {
                  Navigator.pop(context);
                }),
                widget.noteMode == NoteMode.Editing
                    ? _NoteButton('Delete', Colors.green, () async {
                        await NoteProvider.deleteNote(widget.note['id']);
                        Navigator.pop(context);
                      })
                    : SizedBox(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _NoteButton extends StatelessWidget {
  final String _text;
  final Color _color;
  final Function _onPressed;

  _NoteButton(this._text, this._color, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 100,
      onPressed: _onPressed,
      color: _color,
      child: Text(
        _text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
