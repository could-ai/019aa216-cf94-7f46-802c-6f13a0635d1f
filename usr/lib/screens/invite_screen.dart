import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../theme/dos_theme.dart';
import '../widgets/dos_components.dart';

class InviteScreen extends StatelessWidget {
  const InviteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('C:\\NET\\INVITE.EXE'),
      ),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'SCAN TO CONNECT',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text('SHARE THIS CODE WITH FELLOW PARROTS'),
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: DosTheme.primary, width: 4),
                    ),
                    child: QrImageView(
                      data: 'https://parrot-os.net/invite/user_12345',
                      version: QrVersions.auto,
                      size: 200.0,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text('ID: USER_12345_SQWK'),
                  const SizedBox(height: 32),
                  DosButton(
                    label: 'RETURN',
                    isPrimary: false,
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),
          const DosScanline(),
        ],
      ),
    );
  }
}
