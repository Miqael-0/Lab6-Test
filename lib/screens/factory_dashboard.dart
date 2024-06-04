import 'package:flutter/material.dart';
import '../components/alert_banner.dart';
import '../components/bottom_nav_bar.dart';
import '../widgets/factory_button.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class FactoryDashboard extends StatefulWidget {
  @override
  _FactoryDashboardState createState() => _FactoryDashboardState();
}

class _FactoryDashboardState extends State<FactoryDashboard> {
  int _selectedFactoryIndex = 0;
  int _selectedPageIndex = 1; // Set the initial index to 1 for 'Factory' tab to be active

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
              // Navigate to settings screen
              Navigator.pushNamed(context, '/settings', arguments: _selectedFactoryIndex + 1);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: _selectedFactoryIndex == 0 ? _buildFactory1Dashboard() : _buildFactory2Dashboard(),
            ),
            SizedBox(height: 11.5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FactoryButton(
                    label: 'Factory 1',
                    isSelected: _selectedFactoryIndex == 0,
                    onTap: () {
                      setState(() {
                        _selectedFactoryIndex = 0;
                      });
                    },
                  ),
                  FactoryButton(
                    label: 'Factory 2',
                    isSelected: _selectedFactoryIndex == 1,
                    onTap: () {
                      setState(() {
                        _selectedFactoryIndex = 1;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;

            if (index == 0) {
              // Navigate to engineer list for the current factory
              Navigator.pushNamed(context, '/engineerList', arguments: _selectedFactoryIndex + 1);
            } else if (index == 2) {
              // Navigate to notification settings for the current factory
              Navigator.pushNamed(context, '/settings', arguments: _selectedFactoryIndex + 1);
            }
          });
        },
      ),
    );
  }

  Widget _buildFactory1Dashboard() {
    return Column(
      children: [
        AlertBanner(),
        SizedBox(height: 25),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSyncfusionGauge('Steam Pressure', 0.0, 'bar'),
              _buildSyncfusionGauge('Steam Flow', 0.0, 't/h'),
            ],
          ),
        ),
        SizedBox(height: 24),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSyncfusionGauge('Water Level', 0.0, '%'),
              _buildSyncfusionGauge('Power Frequency', 0.0, 'Hz'),
            ],
          ),
        ),
        SizedBox(height: 24),
        Text(
          '2024-04-26 13:45:25',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildFactory2Dashboard() {
    return Column(
      children: [
        Text(
          '1549.7kW',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 24),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSyncfusionGauge('Steam Pressure', 34.19, 'bar'),
              _buildSyncfusionGauge('Steam Flow', 22.82, 't/h'),
            ],
          ),
        ),
        SizedBox(height: 24),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSyncfusionGauge('Water Level', 55.41, '%'),
              _buildSyncfusionGauge('Power Frequency', 50.08, 'Hz'),
            ],
          ),
        ),
        SizedBox(height: 24),
        Text(
          '2024-04-26 13:45:25',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildSyncfusionGauge(String title, double value, String unit) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: SfRadialGauge(
        title: GaugeTitle(
          text: title,
          textStyle: TextStyle(fontSize: 16),
        ),
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 100,
            showLabels: false,
            showTicks: false,
            radiusFactor: 0.8,
            axisLineStyle: AxisLineStyle(
              thickness: 0.2,
              color: Colors.black12,
              thicknessUnit: GaugeSizeUnit.factor,
            ),
            pointers: <GaugePointer>[
              RangePointer(
                value: value,
                width: 0.2,
                sizeUnit: GaugeSizeUnit.factor,
                cornerStyle: CornerStyle.startCurve,
                gradient: SweepGradient(
                  colors: <Color>[Colors.green, Colors.red],
                  stops: <double>[0.0, 0.75],
                ),
              ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                positionFactor: 0.1,
                angle: 90,
                widget: Text(
                  value.toStringAsFixed(2) + unit,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}