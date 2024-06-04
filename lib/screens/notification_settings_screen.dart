import 'package:flutter/material.dart';
import '../components/bottom_nav_bar.dart';
import '../widgets/factory_button.dart';

class NotificationSettingsScreen extends StatefulWidget {
  final int factoryId;

  NotificationSettingsScreen({required this.factoryId});

  @override
  _NotificationSettingsScreenState createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  late int _selectedFactoryIndex;

  @override
  void initState() {
    super.initState();
    _selectedFactoryIndex = widget.factoryId - 1; // Initialize with passed factoryId
  }

  void _updateFactory(int factoryId) {
    setState(() {
      _selectedFactoryIndex = factoryId - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Factory ${_selectedFactoryIndex + 1}',
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
              // Settings action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Text(
                      'Minimum Threshold',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.edit, color: Colors.grey),
                      onPressed: () {
                        // Edit action
                      },
                    ),
                    horizontalTitleGap: 0,
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildParameterTile('Steam Pressure', '29', 'bar'),
                      SizedBox(width: 16),
                      _buildParameterTile('Steam Flow', '22', 'T/H'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildParameterTile('Water Level', '53', '%'),
                      SizedBox(width: 16),
                      _buildParameterTile('Power Frequency', '48', 'Hz'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FactoryButton(
                  label: 'Factory 1',
                  isSelected: _selectedFactoryIndex == 0,
                  onTap: () {
                    _updateFactory(1);
                  },
                ),
                FactoryButton(
                  label: 'Factory 2',
                  isSelected: _selectedFactoryIndex == 1,
                  onTap: () {
                    _updateFactory(2);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/engineerList', arguments: _selectedFactoryIndex + 1);
          } else if (index == 1) {
            Navigator.pushNamed(context, '/dashboard', arguments: _selectedFactoryIndex + 1);
          }
        },
      ),
    );
  }

  Widget _buildParameterTile(String title, String value, String unit) {
    return Expanded(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          value,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  child: VerticalDivider(color: Colors.black),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          unit,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}