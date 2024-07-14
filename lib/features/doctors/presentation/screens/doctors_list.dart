import 'package:flutter/material.dart';
import '../../../drawer_basiclayout/presentation/screens/baselayout.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        child: Center(
      child: Text('Doctors list'),
    ));
  }
}
