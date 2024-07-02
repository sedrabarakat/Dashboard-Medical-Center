import 'package:flutter/cupertino.dart';

import '../../../drawer_basiclayout/presentation/screens/baselayout.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        child: const Center(
      child: Text('Doctor_Profile'),
    ));
  }
}
