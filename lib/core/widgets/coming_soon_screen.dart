import 'package:flutter/material.dart';
import 'package:turbo_waiter/core/widgets/soon_widget.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: SoonWidget());
  }
}
