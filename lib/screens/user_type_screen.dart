import 'package:flutter/material.dart';

class UserTypeScreen extends StatefulWidget {
  const UserTypeScreen({Key? key}) : super(key: key);

  @override
  State<UserTypeScreen> createState() => _UserTypeScreenState();
}

class _UserTypeScreenState extends State<UserTypeScreen> {
  String? selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'SELECT USER TYPE',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: _buildSelectionCard(
                      title: 'As\nLearner',
                      type: 'learner',
                      icon: Icons.school_outlined,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildSelectionCard(
                      title: 'As\nexpert',
                      type: 'expert',
                      icon: Icons.person,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              _buildGetStartedButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectionCard({
    required String title,
    required String type,
    required IconData icon,
  }) {
    final bool isSelected = selectedType == type;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedType = type;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 48,
              color: Colors.black87,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGetStartedButton() {
    final bool isEnabled = selectedType != null;
    
    return ElevatedButton(
      onPressed: isEnabled
          ? () {
              Navigator.pushNamed(context, '/signin');
            }
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnabled ? Colors.blue : Colors.grey.shade300,
        disabledBackgroundColor: Colors.grey.shade300,
        disabledForegroundColor: Colors.grey.shade500,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
      ),
      child: Text(
        'Get started',
        style: TextStyle(
          fontSize: 16,
          color: isEnabled ? Colors.white : Colors.grey.shade500,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}