import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/theme/app_theme.dart';

Widget mementoCardWidget( Function()? onTap, QueryDocumentSnapshot doc){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: AppTheme.cardColors[doc['color_id']],
        borderRadius: BorderRadius.circular(9.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc['note_title'],
            style: AppTheme.mainTitleTheme,
          ),
          const SizedBox(height: 4.0,),
          Text(
            doc['created_at'],
              style: AppTheme.dateTitleTheme,
          ),
          const SizedBox(height: 8.0,),
          Text(
            doc['note_content'],
            style: AppTheme.mainContentTheme,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}