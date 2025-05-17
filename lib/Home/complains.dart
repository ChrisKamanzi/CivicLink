import 'package:civic_link/Providers/complaintNotifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../AI/AiModel.dart';

class Complains extends ConsumerWidget {
  Complains({super.key});

  final _formKey = GlobalKey();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final complaintState = ref.watch(complaintProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
        child: Column(
          children: [
            Text(
              'SUBMIT YOUR COMPLAIN',
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 40),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      hintText: 'Enter an Appropriate Title ',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      prefixIcon: Icon(Icons.title),
                    ),
                  ),

                  SizedBox(height: 50),
                  TextFormField(
                    controller: _descriptionController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: 'Describe Your Complaint',
                      hintText: 'Provide details about your issue...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      prefixIcon: Icon(Icons.feedback),
                    ),
                    keyboardType: TextInputType.multiline,
                  ),

                  SizedBox(height: 40),
                  Container(
                    width: 300,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        try {
                          final assigned = categorizeComplaint(_descriptionController.text);
                          await ref.read(complaintProvider.notifier).submitComplaint(
                            title: _titleController.text,
                            description: _descriptionController.text,
                            assignedAgency: assigned,
                          );
                          print("Complaint submitted!");



                        } catch (e) {
                          print("Submit error: $e");
                        }
                      },


                      child: Text(
                        'SUBMIT',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  TextButton(onPressed: (){
                    FirebaseFirestore.instance.collection('test').add({
                      'message': 'Hello world',
                      'timestamp': FieldValue.serverTimestamp(),
                    });

                  }, child: Text('test'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
