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
      body: FutureBuilder<String?>(
        future: BasicCubit.get(context).getRole(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No role found'));
          } else {
            final role = snapshot.data!;
            return !ResponsiveHelper.isDesktop(context)
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
                      CustomDrawer(role: role),
                      Expanded(
                        child: child,
                      ),
                    ],
                  );
          }
        },
      ),
    );
  }
}
