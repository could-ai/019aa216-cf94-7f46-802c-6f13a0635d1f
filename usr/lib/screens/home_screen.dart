import 'package:flutter/material.dart';
import '../theme/dos_theme.dart';
import '../widgets/dos_components.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Mock data for contacts
  final List<Map<String, String>> _contacts = [
    {'name': 'Polly', 'status': 'ONLINE', 'species': 'Macaw'},
    {'name': 'Rio', 'status': 'AWAY', 'species': 'Spix Macaw'},
    {'name': 'Cookie', 'status': 'BUSY', 'species': 'Cockatoo'},
    {'name': 'Mango', 'status': 'ONLINE', 'species': 'Lovebird'},
  ];

  String _username = 'USER';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is String) {
      _username = args;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('C:\\USERS\\PARROTS\\HOME.EXE'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.pushNamed(context, '/profile', arguments: _username),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: DosTheme.primary.withOpacity(0.1),
                child: Text('WELCOME BACK, $_username', style: DosTheme.textStyle),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _contacts.length,
                  itemBuilder: (context, index) {
                    final contact = _contacts[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: DosBox(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                border: Border.all(color: DosTheme.primary),
                              ),
                              child: const Icon(Icons.face, color: DosTheme.primary),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(contact['name']!, style: DosTheme.headerStyle.copyWith(fontSize: 24)),
                                  Text('${contact['species']} - ${contact['status']}', style: DosTheme.textStyle),
                                ],
                              ),
                            ),
                            DosButton(
                              label: 'CALL',
                              isPrimary: false,
                              onPressed: () {
                                Navigator.pushNamed(context, '/call', arguments: contact['name']);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: DosButton(
                        label: 'ADD PARROT',
                        onPressed: () {
                          // Mock add functionality
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('SEARCHING FREQUENCIES...')),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DosButton(
                        label: 'INVITE QR',
                        isPrimary: true,
                        onPressed: () => Navigator.pushNamed(context, '/invite'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const DosScanline(),
        ],
      ),
    );
  }
}
