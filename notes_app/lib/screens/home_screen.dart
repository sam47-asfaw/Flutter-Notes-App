import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/theme/app_theme.dart';
import 'package:notes_app/widgets/memento_card_widget.dart';
import 'screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      appBar: AppBar(
        elevation: 1.0,
        title: Text("Memento"),
        centerTitle: true,
        backgroundColor: AppTheme.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your recent Notes",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("notes").snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                      //check for connection
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if(snapshot.hasData){
                      return GridView(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        children: snapshot.data!.docs.map(
                                (memento) =>
                                  mementoCardWidget((){
                                    Navigator.push(context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MementoReaderScreen(doc: memento),
                                        )
                                    );
                                  }, memento)
                        ).toList(),
                      );
                    }
                    return Text(
                        "No memento to display",
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 10.0,
                      ),

                    );
                  }
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => const MementoEditScreen(),
            ),
            );
          },
        child: const Icon(
            Icons.add,
          size: 20.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
