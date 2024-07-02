import 'package:flutter/cupertino.dart';

import '../../../drawer_basiclayout/presentation/screens/baselayout.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        child: const Center(
      child: Text('Doctors_List'),
    ));
  }
}
