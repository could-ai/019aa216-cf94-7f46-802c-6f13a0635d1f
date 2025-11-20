import 'dart:async';
import 'package:flutter/material.dart';
import '../theme/dos_theme.dart';
import '../widgets/dos_components.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  String _contactName = 'UNKNOWN';
  String _status = 'DIALING...';
  int _seconds = 0;
  Timer? _timer;
  bool _isConnected = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is String) {
      _contactName = args;
    }
    
    // Simulate connection delay
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _status = 'CONNECTED';
          _isConnected = true;
          _startTimer();
        });
      }
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _seconds++;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _formattedTime {
    final minutes = (_seconds / 60).floor().toString().padLeft(2, '0');
    final seconds = (_seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: DosTheme.primary, width: 2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.face, size: 100, color: DosTheme.primary),
                      ),
                      const SizedBox(height: 24),
                      Text(_contactName, style: DosTheme.headerStyle),
                      const SizedBox(height: 8),
                      Text(_status, style: const TextStyle(color: DosTheme.secondary)),
                      if (_isConnected) ...[
                        const SizedBox(height: 8),
                        Text(_formattedTime, style: DosTheme.headerStyle),
                      ],
                      const SizedBox(height: 48),
                      // Audio visualizer simulation
                      if (_isConnected)
                        SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(10, (index) {
                              return Container(
                                width: 8,
                                margin: const EdgeInsets.symmetric(horizontal: 2),
                                height: 10.0 + (index % 3) * 10 + (_seconds % 2) * 15,
                                color: DosTheme.primary,
                              );
                            }),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: DosTheme.primary)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.mic_off),
                      iconSize: 32,
                      onPressed: () {},
                    ),
                    FloatingActionButton(
                      backgroundColor: DosTheme.alert,
                      onPressed: () => Navigator.pop(context),
                      child: const Icon(Icons.call_end, color: Colors.white),
                    ),
                    IconButton(
                      icon: const Icon(Icons.videocam_off),
                      iconSize: 32,
                      onPressed: () {},
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
