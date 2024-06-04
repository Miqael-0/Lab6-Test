import 'package:flutter/material.dart';
import '../components/bottom_nav_bar.dart';
import '../widgets/factory_button.dart';

class EngineerListScreen extends StatefulWidget {
  final int factoryId;

  EngineerListScreen({required this.factoryId});

  @override
  _EngineerListScreenState createState() => _EngineerListScreenState();
}

class _EngineerListScreenState extends State<EngineerListScreen> {
  List<Map<String, String>> _engineers = [];
  late int _currentFactoryId;

  @override
  void initState() {
    super.initState();
    _currentFactoryId = widget.factoryId;
    _initializeEngineers();
  }

  void _initializeEngineers() {
    if (_currentFactoryId == 1) {
      _engineers = [
        {'name': 'Ben', 'phoneNumber': '+60109219938'},
        {'name': 'Testing 1', 'phoneNumber': '+601234567891'},
        {'name': 'Hello', 'phoneNumber': '+60123456789'},
      ];
    } else {
      _engineers = [
        {'name': 'John', 'phoneNumber': '+60109876543'},
        {'name': 'Jane', 'phoneNumber': '+60102345678'},
        {'name': 'Smith', 'phoneNumber': '+60101234567'},
      ];
    }
  }

  void _addEngineer(Map<String, String> newEngineer) {
    setState(() {
      _engineers.add(newEngineer);
    });
  }

  void _updateFactory(int factoryId) {
    setState(() {
      _currentFactoryId = factoryId;
      _initializeEngineers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Factory $_currentFactoryId Engineers',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings screen
              Navigator.pushNamed(context, '/settings', arguments: _currentFactoryId);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Stack(
                    children: [
                      ListView(
                        padding: EdgeInsets.only(bottom: 56.0),
                        children: _engineers
                            .map((engineer) => ContactCard(
                          name: engineer['name']!,
                          phoneNumber: engineer['phoneNumber']!,
                        ))
                            .toList(),
                      ),
                      Positioned(
                        bottom: 16.0,
                        right: 16.0,
                        child: FloatingActionButton(
                          onPressed: () async {
                            final result = await Navigator.pushNamed(
                              context,
                              '/invitation',
                              arguments: _currentFactoryId,
                            );

                            if (result != null && result is Map<String, String>) {
                              _addEngineer(result);
                            }
                          },
                          child: Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 11.5),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FactoryButton(
                      label: 'Factory 1',
                      isSelected: _currentFactoryId == 1,
                      onTap: () {
                        _updateFactory(1);
                      },
                    ),
                    SizedBox(width: 16.0),
                    FactoryButton(
                      label: 'Factory 2',
                      isSelected: _currentFactoryId == 2,
                      onTap: () {
                        _updateFactory(2);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0, // Index for the Engineer icon
        onTap: (index) {
          if (index == 0) {
            // Engineer icon tapped
          } else if (index == 1) {
            // Factory icon tapped
            Navigator.pushNamed(context, '/dashboard');
          } else if (index == 2) {
            // Settings icon tapped
            Navigator.pushNamed(context, '/settings', arguments: _currentFactoryId);
          }
        },
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String name;
  final String phoneNumber;

  const ContactCard({
    Key? key,
    required this.name,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.grey[200], // Change the color to a lighter shade
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              phoneNumber,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}