import 'package:dashboad/core/helpers/responsive_helper.dart';
import 'package:dashboad/features/drawer_basiclayout/presentation/cubits/basic_cubit.dart';
import 'package:dashboad/features/drawer_basiclayout/presentation/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/colors_helper.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: BasicCubit.get(context).scaffoldKey,
      backgroundColor: ColorsHelper.basicBackground,
      drawer: const CustomDrawer(),
      body: !ResponsiveHelper.isDesktop(context)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    BasicCubit.get(context).controlMenu();
                  },
                  icon: const Icon(
                    Icons.menu,
                  ),
                ),
                Expanded(
                  child: child,
                )
              ],
            )
          : Row(
              children: [
                const CustomDrawer(),
                Expanded(
                  child: child,
                ),
              ],
            ),
    );
  }
}

// Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (!ResponsiveHelper.isDesktop(context))
//             Container(
//               color: Colors.blue,
//               child: IconButton(
//                 onPressed: () {
//                   BasicCubit.get(context).controlMenu();
//                 },
//                 icon: const Icon(
//                   Icons.menu,
//                 ),
//               ),
//             ),
//           if (ResponsiveHelper.isDesktop(context)) const CustomDrawer(),
//           Expanded(
//             child: Container(
//               color: Colors.red,
//               child: child,
//             ),
//           )
//         ],
//       ),
//Color.fromARGB(255, 10, 185, 181)
