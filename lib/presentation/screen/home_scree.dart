import 'package:flutter/material.dart';
import 'package:user_app/presentation/widgets/appbar.dart';

class HomeScree extends StatelessWidget {
  const HomeScree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("data"),),
      body: Column(
        children: [
          Text("data")
        ],
      ),
    
    );
  }
}