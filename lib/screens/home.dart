import 'package:flutter/material.dart';
import 'package:rizqunatravel/screens/dashboard.dart';
import 'package:rizqunatravel/screens/page_agent.dart';

import 'component.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedMenuItemIndex = 1; // Default index for Dashboard

  void _onMenuItemSelected(int index) {
    setState(() {
      _selectedMenuItemIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rizquna Travel'),
        ),
        drawer: Sidebar(
          onItemSelected: _onMenuItemSelected,
        ),
        body: _buildBody(_selectedMenuItemIndex),
      ),
    );
  }

  Widget _buildBody(int selectedIndex) {
    switch (selectedIndex) {
      case 1:
        return const DashboardPage();
      case 2:
        // Return Agent Page
        return const AgentPage(); // Replace Container with Agent Page
      case 3:
        // Return Hotel Page
        return Container(); // Replace Container with Hotel Page
      case 4:
        // Return Room Page
        return Container(); // Replace Container with Room Page
      case 5:
        // Return Rekening Page
        return Container(); // Replace Container with Rekening Page
      case 6:
        // Return Booking Hotel Page
        return Container(); // Replace Container with Booking Hotel Page
      case 7:
        // Return Payment Hotel Page
        return Container(); // Replace Container with Payment Hotel Page
      default:
        return const SizedBox(); // Return an empty container by default
    }
  }
}
