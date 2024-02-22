import 'package:flutter/material.dart';
import 'package:rizqunatravel/screens/component.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Builder(
          builder: (context) {
            return GridView.count(
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
            );
          },
        ),
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
                  ? 50
                  : 30, // Adjust icon size based on screen width
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
}
