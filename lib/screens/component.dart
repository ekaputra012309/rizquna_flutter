import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  final Function(int) onItemSelected;

  const Sidebar({Key? key, required this.onItemSelected}) : super(key: key);

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool isMasterDataExpanded = false;
  bool isHeaderExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                ),
                accountName: const Text('John Doe'),
                accountEmail: const Text('johndoe@example.com'),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    'JD',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                onDetailsPressed: () {
                  setState(() {
                    isHeaderExpanded = !isHeaderExpanded;
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.dashboard),
                title: const Text('Dashboard'),
                onTap: () {
                  widget.onItemSelected(1);
                },
              ),
              ListTile(
                leading: const Icon(Icons.shield),
                title: const Text('Master Data'),
                onTap: () {
                  setState(() {
                    isMasterDataExpanded = !isMasterDataExpanded;
                  });
                },
              ),
              if (isMasterDataExpanded) ...[
                Padding(
                  padding: const EdgeInsets.only(left: 36),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Agent'),
                        onTap: () {
                          widget.onItemSelected(2);
                        },
                      ),
                      ListTile(
                        title: const Text('Hotel'),
                        onTap: () {
                          widget.onItemSelected(3);
                        },
                      ),
                      ListTile(
                        title: const Text('Room'),
                        onTap: () {
                          widget.onItemSelected(4);
                        },
                      ),
                      ListTile(
                        title: const Text('Rekening'),
                        onTap: () {
                          widget.onItemSelected(5);
                        },
                      ),
                    ],
                  ),
                ),
              ],
              const Divider(),
              const ListTile(
                title: Text('Transaction'),
              ),
              ListTile(
                leading: const Icon(Icons.apartment),
                title: const Text('Booking Hotel'),
                onTap: () {
                  widget.onItemSelected(6);
                },
              ),
              ListTile(
                leading: const Icon(Icons.payment),
                title: const Text('Payment Hotel'),
                onTap: () {
                  widget.onItemSelected(7);
                },
              ),
            ],
          ),
          if (isHeaderExpanded) ...[
            Positioned(
              top: 160, // Adjust this value as needed to position the items
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: const Text(
                        'Change Password',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: const Icon(Icons.lock),
                      onTap: () {
                        // Handle change password
                      },
                    ),
                    ListTile(
                      title: const Text(
                        'Logout',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: const Icon(Icons.logout),
                      onTap: () {
                        // Handle logout
                      },
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
