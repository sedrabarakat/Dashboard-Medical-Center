import 'package:flutter/cupertino.dart';

import '../../../drawer_basiclayout/presentation/screens/baselayout.dart';

class DirectorsList extends StatelessWidget {
  const DirectorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        child: const Center(
      child: Text('Directors_List'),
    ));
  }
}
