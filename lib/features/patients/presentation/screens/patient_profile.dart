import 'package:flutter/cupertino.dart';

import '../../../drawer_basiclayout/presentation/screens/baselayout.dart';

class PatientProfile extends StatelessWidget {
  const PatientProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseLayout(
        child: Center(
      child: Text('Patient_Profile'),
    ));
  }
}
