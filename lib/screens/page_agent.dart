import 'package:flutter/material.dart';

class AgentPage extends StatelessWidget {
  const AgentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agent'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: AgentList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AgentList extends StatelessWidget {
  const AgentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 18, // Replace this with the actual number of agents
      itemBuilder: (context, index) {
        return AgentCard(agentName: 'Agent ${index + 1}');
      },
    );
  }
}

class AgentCard extends StatelessWidget {
  final String agentName;

  const AgentCard({Key? key, required this.agentName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(agentName),
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return AgentDetailsBottomSheet(agentName: agentName);
            },
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            isScrollControlled: true,
          );
        },
      ),
    );
  }
}

class AgentDetailsBottomSheet extends StatelessWidget {
  final String agentName;

  const AgentDetailsBottomSheet({Key? key, required this.agentName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Agent Details',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Divider(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 56.0,
                  ),
                  child: ListView(
                    children: <Widget>[
                      _buildAgentInfoItem('Agent Name', agentName),
                      _buildAgentInfoItem('Contact Person', 'John Doe'),
                      _buildAgentInfoItem('Telephone', '+1234567890'),
                      _buildAgentInfoItem('Address', '123 Main Street'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.pop(
                            context); // Dismiss current modal bottom sheet
                        _showEditAgentBottomSheet(
                            context); // Show edit bottom sheet
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _showDeleteConfirmationDialog(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAgentInfoItem(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(subtitle),
        const SizedBox(height: 8),
      ],
    );
  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete this agent?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                // Perform delete action
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showEditAgentBottomSheet(BuildContext context) async {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String? agentName;
    String? contactPerson;
    String? telephone;
    String? address;

    void _saveForm() {
      final bool isValid = _formKey.currentState!.validate();
      if (!isValid) {
        return;
      }
      // Form is valid, perform save action
      // Update agent details with the new values
      // Close the bottom sheet
      Navigator.of(context).pop();
    }

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.9,
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Edit Agent',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Divider(),
                      // Form for editing agent details
                      TextFormField(
                        initialValue: agentName,
                        decoration: const InputDecoration(
                          labelText: 'Agent Name',
                          hintText: 'Enter agent name',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter agent name';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          agentName = newValue;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        initialValue: contactPerson,
                        decoration: const InputDecoration(
                          labelText: 'Contact Person',
                          hintText: 'Enter contact person',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter contact person';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          contactPerson = newValue;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        initialValue: telephone,
                        decoration: const InputDecoration(
                          labelText: 'Telephone',
                          hintText: 'Enter telephone number',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter telephone number';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          telephone = newValue;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        initialValue: address,
                        decoration: const InputDecoration(
                          labelText: 'Address',
                          hintText: 'Enter address',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter address';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          address = newValue;
                        },
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                  // Positioned Save Button
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ElevatedButton.icon(
                        onPressed: _saveForm,
                        icon: const Icon(Icons.save),
                        label: const Text('Save'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
