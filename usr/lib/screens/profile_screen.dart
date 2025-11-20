import 'package:flutter/material.dart';
import '../theme/dos_theme.dart';
import '../widgets/dos_components.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _speciesController = TextEditingController();
  final TextEditingController _snackController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is String && _nameController.text.isEmpty) {
      _nameController.text = args;
      _speciesController.text = "Unknown Bird";
      _snackController.text = "Crackers";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('C:\\SYSTEM\\PROFILE.CFG'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: DosTheme.primary, width: 4),
                    ),
                    child: const Icon(Icons.person_outline, size: 80, color: DosTheme.primary),
                  ),
                ),
                const SizedBox(height: 32),
                DosBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('// USER CONFIGURATION', style: TextStyle(color: DosTheme.secondary)),
                      const SizedBox(height: 16),
                      DosTextField(controller: _nameController, label: 'DISPLAY NAME'),
                      const SizedBox(height: 16),
                      DosTextField(controller: _speciesController, label: 'SPECIES'),
                      const SizedBox(height: 16),
                      DosTextField(controller: _snackController, label: 'FAVORITE SNACK'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: DosButton(
                    label: 'SAVE CHANGES',
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('PROFILE UPDATED SUCCESSFULLY')),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const DosScanline(),
        ],
      ),
    );
  }
}
