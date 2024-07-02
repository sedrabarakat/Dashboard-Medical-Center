import 'package:flutter/cupertino.dart';

import '../../../drawer_basiclayout/presentation/screens/baselayout.dart';

class PatientsList extends StatelessWidget {
  const PatientsList({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseLayout(
        child: Center(
      child: Text('Patients_List'),
    ));
  }
}
