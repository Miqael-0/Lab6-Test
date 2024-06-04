import 'package:flutter/material.dart';

class InvitationScreen extends StatelessWidget {
  final int factoryId;
  late String ownerName;
  late String ownerPhoneNumber;

  InvitationScreen({required this.factoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Factory $factoryId',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Handle settings button action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Invitation',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 4.0),
            Center(
              child: Text(
                'Invite users',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 32.0),
            Text(
              "Owner's Name",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              onChanged: (value) {
                ownerName = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type here',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Owner's Phone Number",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              onChanged: (value) {
                ownerPhoneNumber = value;
              },
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'images/Flag_of_Malaysia.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                border: OutlineInputBorder(),
                hintText: 'Enter your phone number...',
                prefixText: '+60 ',
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                if (ownerName.isNotEmpty && ownerPhoneNumber.isNotEmpty) {
                  // Pop the screen with the new engineer information
                  Navigator.pop(
                    context,
                    {
                      'name': ownerName,
                      'phoneNumber': ownerPhoneNumber,
                    },
                  );
                }
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.grey,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}