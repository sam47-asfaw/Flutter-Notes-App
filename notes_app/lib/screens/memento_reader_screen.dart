import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class MementoReaderScreen extends StatefulWidget {

  final QueryDocumentSnapshot doc;
   const MementoReaderScreen({
     Key? key,
    required this.doc
   }) : super(key: key);

  @override
  State<MementoReaderScreen> createState() => _MementoReaderScreenState();
}

class _MementoReaderScreenState extends State<MementoReaderScreen> {
  @override
  Widget build(BuildContext context) {
    int colorId = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppTheme.cardColors[colorId],
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: AppTheme.cardColors[colorId],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc['note_title'],
              style: AppTheme.mainTitleTheme,
            ),
            const SizedBox(height: 4.0,),
            Text(
              widget.doc['created_at'],
              style: AppTheme.dateTitleTheme,
            ),
            const SizedBox(height: 20.0,),
            Text(
              widget.doc['note_content'],
              style: AppTheme.mainContentTheme,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
