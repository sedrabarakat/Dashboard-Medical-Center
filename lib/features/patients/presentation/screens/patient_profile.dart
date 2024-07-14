import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../drawer_basiclayout/presentation/screens/baselayout.dart';

class PatientProfile extends StatelessWidget {
  const PatientProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Text("patient profile"),
    );
  }
}
