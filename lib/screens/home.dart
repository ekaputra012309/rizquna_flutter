import 'package:flutter/material.dart';

import 'component.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rizquna Travel'),
        ),
        drawer: Sidebar(
          onItemSelected: (index) {
            // Handle selected item
            debugPrint('Item selected: $index');
          },
        ),
        body: const Center(
          child: Text('Main Content'),
        ),
      ),
    );
  }
}
