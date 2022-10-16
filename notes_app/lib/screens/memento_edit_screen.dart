import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MementoEditScreen extends StatefulWidget {
  const MementoEditScreen({Key? key}) : super(key: key);

  @override
  State<MementoEditScreen> createState() => _MementoEditScreenState();
}

class _MementoEditScreenState extends State<MementoEditScreen> {
  
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _mainContentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    int colorId = Random().nextInt(AppTheme.cardColors.length);
    String date = DateTime.now().toString();
    return Scaffold(
      backgroundColor: AppTheme.cardColors[colorId],
      appBar: AppBar(
        elevation: 1.0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: AppTheme.cardColors[colorId],
        title: Text("Add new memento", style: AppTheme.mainTitleTheme,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Memento Title"
              ),
              style: AppTheme.mainTitleTheme,
            ),
            const SizedBox(height: 8.0,),
            Text(date, style: AppTheme.dateTitleTheme,),
            const SizedBox(height: 20.0,),
            TextField(
              controller: _mainContentController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Memento description",
              ),
              style: AppTheme.mainContentTheme,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.accentColor,
        onPressed: () async{
          FirebaseFirestore.instance.collection("notes").add({
            "note_title": _titleController.text,
            "created_at": date,
            "note_content": _mainContentController.text,
            "color_id": colorId,
          }).then(
                  (value){
                    print(value.id);
                    Navigator.pop(context);
                  }).catchError((error) => print("Failed to add memento due to $error"));
        },
        child: const Icon(
          Icons.save_alt_rounded,
          size: 20.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
