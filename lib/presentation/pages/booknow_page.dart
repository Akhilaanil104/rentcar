import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class BookNowPage extends StatefulWidget {
  final Map<String, String> car; // Pass car details

  BookNowPage({super.key, required this.car});

  @override
  _BookNowPageState createState() => _BookNowPageState();
}

class _BookNowPageState extends State<BookNowPage> {
  DateTime? _startDate;
  DateTime? _endDate;
  final TextEditingController _pickupLocationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book ${widget.car['name'] ?? 'Car'}'),
        backgroundColor: Color.fromARGB(255, 102, 114, 193),
      ),
      body: Stack(
        children: [
          // Background color consistent with the onboarding theme
          Container(
            color: Color.fromARGB(255, 102, 114, 193).withOpacity(0.8),
          ),
          // Dark overlay to match the design
          Container(
            color: Colors.black.withOpacity(0.4),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Car name and description
                    Text(
                      widget.car['name'] ?? 'Car Name',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Book your ${widget.car['name'] ?? 'car'} for a great experience!',
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                    SizedBox(height: 24.0),

                    // Rental Start Date Field
                    _buildDateField(
                      label: 'Start Date',
                      selectedDate: _startDate,
                      onTap: () async {
                        DateTime? pickedDate = await _selectDate(context);
                        if (pickedDate != null) {
                          setState(() {
                            _startDate = pickedDate;
                          });
                        }
                      },
                    ),
                    SizedBox(height: 16.0),

                    // Rental End Date Field
                    _buildDateField(
                      label: 'End Date',
                      selectedDate: _endDate,
                      onTap: () async {
                        DateTime? pickedDate = await _selectDate(context);
                        if (pickedDate != null) {
                          setState(() {
                            _endDate = pickedDate;
                          });
                        }
                      },
                    ),
                    SizedBox(height: 16.0),

                    // Pickup Location Input Field (Custom Entry)
                    TextFormField(
                      controller: _pickupLocationController,
                      decoration: InputDecoration(
                        labelText: 'Enter Pickup Location',
                        labelStyle: TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a pickup location';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.0),

                    // "Book Now" Button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // Handle booking logic
                            _showBookingConfirmation();
                          }
                        },
                        child: Text('Book Now'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Color.fromARGB(255, 102, 114, 193),
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12),
                          textStyle: TextStyle(fontSize: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: 20), // Added space to avoid clipping
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for the Date Picker Field
  Widget _buildDateField({
    required String label,
    required DateTime? selectedDate,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate != null
                  ? DateFormat.yMMMd().format(selectedDate)
                  : 'Select $label',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Icon(Icons.calendar_today, color: Colors.white),
          ],
        ),
      ),
    );
  }

  // Function to select a date
  Future<DateTime?> _selectDate(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Color.fromARGB(255, 102, 114, 193), // Accent color
              onPrimary: Colors.black, // Text color on button
              surface: Colors.white, // Background of the date picker
              onSurface: Colors.black, // Text color on date picker
            ),
            dialogBackgroundColor: Colors.white, // White background for picker
          ),
          child: child!,
        );
      },
    );
  }

  // Function to show booking confirmation
  void _showBookingConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Booking Confirmed'),
        content: Text('Your booking for ${widget.car['name']} has been confirmed!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              Navigator.of(context).pop(); // Go back to the previous page
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
