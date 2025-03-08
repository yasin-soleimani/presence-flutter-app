import 'package:flutter/material.dart';

class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('داشبورد کاربر'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // TODO: Implement logout logic
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'خوش آمدید!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              _buildInfoCard(
                title: 'اطلاعات شخصی',
                icon: Icons.person,
                onTap: () {
                  // TODO: Navigate to profile page
                },
              ),
              const SizedBox(height: 16),
              _buildInfoCard(
                title: 'تنظیمات',
                icon: Icons.settings,
                onTap: () {
                  // TODO: Navigate to settings page
                },
              ),
              const SizedBox(height: 16),
              _buildInfoCard(
                title: 'پشتیبانی',
                icon: Icons.support_agent,
                onTap: () {
                  // TODO: Navigate to support page
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
