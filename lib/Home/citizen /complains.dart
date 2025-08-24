import 'package:civic_link/Providers/complaintNotifier.dart';
import 'package:civic_link/widgets/BottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../AI/AiModel.dart';

class Complains extends ConsumerWidget {
  Complains({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final primaryColor = Color.fromRGBO(246, 27, 43, 100);
  final secondaryColor = Colors.white;
  final greyColor = Color.fromRGBO(97, 97, 97, 100);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(ComplainProvider);
    final complaintState = ref.watch(ComplainProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Submit Complaint',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w800,
            color: primaryColor,
            fontSize: 30,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: TextStyle(
                          color: secondaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                        hintText: 'Enter an Appropriate Title',
                        prefixIcon: Icon(Icons.title, color: primaryColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Please enter a title'
                                  : null,
                    ),
                    SizedBox(height: 32),
                    TextFormField(
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      controller: _descriptionController,
                      maxLines: 6,
                      decoration: InputDecoration(
                        labelText: 'Describe Your Complaint',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: secondaryColor,
                        ),
                        hintText: 'Provide details about your issue...',
                        prefixIcon: Icon(Icons.feedback, color: primaryColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.multiline,
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Please provide complaint details'
                                  : null,
                    ),
                    SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {

                      },
                      child: Row(
                          children: [

                        Text('Upload Image ', style: GoogleFonts.brawler(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: Colors.white
                        ),),

                        Icon(Icons.camera_alt, size: 20,color: Colors.white,),

                      ]
                      ),
                    ),
                    SizedBox(height: 40),

                    SizedBox(
                      width: 320,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade800,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onPressed:
                            isLoading
                                ? null
                                : () async {
                                  if (_formKey.currentState!.validate()) {
                                    String title = _titleController.text.trim();
                                    String description =
                                        _descriptionController.text.trim();
                                    String department = categorizeComplaint(
                                      description,
                                    );
                                    debugPrint(department);
                                    try {
                                      await complaintState.submitComplaint(
                                        title: title,
                                        description: description,
                                        status: 'pending',
                                        department: department,
                                      );
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Complaint submitted successfully!',
                                          ),
                                          backgroundColor: Colors.green,
                                        ),
                                      );
                                    } catch (e) {
                                      throw Exception(e);
                                    }
                                  }
                                },

                        child:
                            isLoading
                                ? const SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2.5,
                                  ),
                                )
                                : Text(
                                  'SUBMIT',
                                  style: GoogleFonts.inter(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: secondaryColor,
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
