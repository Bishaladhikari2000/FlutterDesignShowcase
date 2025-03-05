import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoWidgetsScreen extends StatefulWidget {
  const CupertinoWidgetsScreen({super.key});

  @override
  State<CupertinoWidgetsScreen> createState() => _CupertinoWidgetsScreenState();
}

class _CupertinoWidgetsScreenState extends State<CupertinoWidgetsScreen> {
  bool _switchValue = false;
  int _selectedSegment = 0;
  double _sliderValue = 0.5;
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Cupertino Widgets'),
      ),
      backgroundColor: CupertinoColors.systemBackground,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildSection(
              'Basic Controls',
              [
                CupertinoButton(
                  onPressed: () {},
                  child: const Text('Cupertino Button'),
                ),
                const SizedBox(height: 16),
                CupertinoButton.filled(
                  onPressed: () {},
                  child: const Text('Filled Button'),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Switch',
                      style: TextStyle(
                        color: CupertinoColors.label,
                        fontSize: 16,
                      ),
                    ),
                    CupertinoSwitch(
                      value: _switchValue,
                      onChanged: (value) {
                        setState(() {
                          _switchValue = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            _buildSection(
              'Segmented Control',
              [
                CupertinoSegmentedControl<int>(
                  children: const {
                    0: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'First',
                        style: TextStyle(color: CupertinoColors.label),
                      ),
                    ),
                    1: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Second',
                        style: TextStyle(color: CupertinoColors.label),
                      ),
                    ),
                    2: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Third',
                        style: TextStyle(color: CupertinoColors.label),
                      ),
                    ),
                  },
                  onValueChanged: (value) {
                    setState(() {
                      _selectedSegment = value;
                    });
                  },
                  groupValue: _selectedSegment,
                ),
              ],
            ),
            _buildSection(
              'Slider',
              [
                CupertinoSlider(
                  value: _sliderValue,
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                ),
              ],
            ),
            _buildSection(
              'Context Menu',
              [
                CupertinoContextMenu(
                  actions: [
                    CupertinoContextMenuAction(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      isDefaultAction: true,
                      child: const Text('Default Action'),
                    ),
                    CupertinoContextMenuAction(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Action 2'),
                    ),
                  ],
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemGrey5,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Long press me to show context menu',
                      style: TextStyle(
                        fontSize: 16,
                        color: CupertinoColors.label,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            _buildSection(
              'Date Picker',
              [
                CupertinoButton(
                  onPressed: () {
                    _showDatePicker(context);
                  },
                  child: Text(
                    'Selected Date: ${_selectedDate.toString().split(' ')[0]}',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.label,
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  void _showDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: CupertinoDatePicker(
            initialDateTime: _selectedDate,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (DateTime newDate) {
              setState(() {
                _selectedDate = newDate;
              });
            },
          ),
        ),
      ),
    );
  }
}