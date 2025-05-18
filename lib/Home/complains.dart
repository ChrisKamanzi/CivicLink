import 'package:civic_link/Providers/complaintNotifier.dart';
import 'package:civic_link/widgets/BottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../AI/AiModel.dart';

class Complains extends ConsumerWidget {
  Complains({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final primaryColor = Colors.orange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final complaintState = ref.watch(complaintProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Submit Complaint',
          style: GoogleFonts.inter(fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: SingleChildScrollView(
          child: Column(
            children: [
SizedBox(height: 50,),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Title',
                        hintText: 'Enter an Appropriate Title',
                        prefixIcon: Icon(Icons.title, color: primaryColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 2.0),
                        ),
                      ),
                      validator: (value) =>
                      value == null || value.isEmpty ? 'Please enter a title' : null,
                    ),
                    SizedBox(height: 32),
                    TextFormField(
                      controller: _descriptionController,
                      maxLines: 6,
                      decoration: InputDecoration(
                        labelText: 'Describe Your Complaint',
                        hintText: 'Provide details about your issue...',
                        prefixIcon: Icon(Icons.feedback, color: primaryColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 2.0),
                        ),
                      ),
                      keyboardType: TextInputType.multiline,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please provide complaint details'
                          : null,
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      width: 320,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 5,
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                              final assigned = categorizeComplaint(_descriptionController.text);
                              await ref.read(complaintProvider.notifier).submitComplaint(
                                title: _titleController.text,
                                description: _descriptionController.text,
                                assignedAgency: assigned,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Complaint submitted successfully!')),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Error submitting complaint: $e')),
                              );
                            }
                          }
                        },
                        child: Text(
                          'SUBMIT',
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Bottomnavbar(currentIndex: 1),
    );
  }
}
