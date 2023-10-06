import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:blogapp/database/blogdatabase.dart';
import 'package:blogapp/models/note.dart';
//import 'package:sqflite_database_example/page/edit_note_page.dart';
import 'package:blogapp/Views/blog_detailpage.dart';
import 'package:blogapp/widget/blog_cardwidget.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.notes = await NotesDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('BLog', style: TextStyle(color: Colors.black)),
            Text('Explorer', style: TextStyle(color: Colors.blueAccent))
          ],
        ),
      ),
    ),
    body: const Text('Will implement it later ,sorry its getting late'),
    // body: Center(
    //   child: isLoading
    //       ? CircularProgressIndicator()
    //       : notes.isEmpty
    //       ? const Text(
    //     'No Blogs Stored',
    //     style: TextStyle(color: Colors.white, fontSize: 24),
    //   )
          // : buildNotes(),
    // ),)
  );

  // Widget buildNotes() => StaggeredGridView.countBuilder(
  //   padding: EdgeInsets.all(8),
  //   itemCount: notes.length,
  //   staggeredTileBuilder: (index) => StaggeredTile.fit(2),
  //   crossAxisCount: 4,
  //   mainAxisSpacing: 4,
  //   crossAxisSpacing: 4,
  //   itemBuilder: (context, index) {
  //     final note = notes[index];
  //
  //     return GestureDetector(
  //       onTap: () async {
  //         await Navigator.of(context).push(MaterialPageRoute(
  //           builder: (context) => (noteId: note.id!),
  //         ));
  //
  //         refreshNotes();
  //       },
  //       child: NoteCardWidget(note: note, index: index),
  //     );
  //   },
  // );
}