import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/values_manager.dart';
import 'package:dashboad/features/doctors/presentation/widgets/table/table_header.dart';
import 'package:dashboad/features/doctors/presentation/widgets/table/table_row.dart';
import 'package:flutter/material.dart';

import '../../../drawer_basiclayout/presentation/screens/baselayout.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Padding(
        padding: const EdgeInsets.all(
          AppPadding.p30,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorsHelper.lightGry,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              const TableHeader(),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => MyTableRow(
                    onEditPressed: () {},
                    onRemovePressed: () {},
                  ),
                  itemCount: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
