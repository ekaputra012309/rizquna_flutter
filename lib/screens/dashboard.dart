import 'package:flutter/material.dart';
import 'package:rizqunatravel/screens/component.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: MediaQuery.of(context).size.width > 600
                      ? 4
                      : 2, // Adjust cross axis count based on screen width
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  children: [
                    _buildItem(context, Icons.home, 'Home'),
                    _buildItem(context, Icons.settings, 'Settings'),
                    _buildItem(context, Icons.notifications, 'Notifications'),
                    _buildItem(context, Icons.person, 'Profile'),
                  ],
                ),
              ),
              _buildListOutsideGridView(), // Your list of cards
            ],
          );
        },
      ),
    );
  }

  Widget _buildItem(BuildContext context, IconData icon, String label) {
    return Card(
      child: InkWell(
        onTap: () {
          // Handle onTap event
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: MediaQuery.of(context).size.width > 600
                  ? 60
                  : 50, // Adjust icon size based on screen width
              color:
                  CustomColor.colorSatu, // You can set your desired color here
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListOutsideGridView() {
    // Replace this with your list of cards
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'List of Cards',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildCard('Card 1'),
          _buildCard('Card 2'),
          _buildCard('Card 3'),
        ],
      ),
    );
  }

  Widget _buildCard(String title) {
    return Card(
      child: ListTile(
        title: Text(title),
        onTap: () {
          // Handle onTap event for cards
        },
      ),
    );
  }
}
