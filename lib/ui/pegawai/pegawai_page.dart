import 'package:belajar_1/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<StatefulWidget> createState() => PegawaiPageState();
}

class PegawaiPageState extends State<PegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Data Poli",
      ),
      body: ListView(
        children: const [],
      ),
    );
  }
}