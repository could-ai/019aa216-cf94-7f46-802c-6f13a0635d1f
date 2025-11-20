import 'package:flutter/material.dart';
import '../theme/dos_theme.dart';

class DosBox extends StatelessWidget {
  final Widget child;
  final bool showBorder;
  final EdgeInsetsGeometry padding;

  const DosBox({
    super.key, 
    required this.child, 
    this.showBorder = true,
    this.padding = const EdgeInsets.all(16.0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: showBorder ? BoxDecoration(
        border: Border.all(color: DosTheme.primary, width: 2),
        color: Colors.black,
      ) : null,
      child: child,
    );
  }
}

class DosButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isPrimary;

  const DosButton({
    super.key, 
    required this.label, 
    required this.onPressed,
    this.isPrimary = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          color: isPrimary ? DosTheme.primary : Colors.transparent,
          border: Border.all(color: DosTheme.primary, width: 2),
        ),
        child: Text(
          '[ ${label.toUpperCase()} ]',
          style: DosTheme.textStyle.copyWith(
            color: isPrimary ? Colors.black : DosTheme.primary,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class DosTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;

  const DosTextField({
    super.key,
    required this.controller,
    required this.label,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label:', style: DosTheme.textStyle),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          obscureText: obscureText,
          style: DosTheme.textStyle,
          cursorColor: DosTheme.primary,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(12),
            suffixText: '_', // Blinking cursor simulation static for now
          ),
        ),
      ],
    );
  }
}

class DosScanline extends StatelessWidget {
  const DosScanline({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.1),
            ],
            stops: const [0.5, 0.5],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}
