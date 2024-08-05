import 'package:dashboad/core/data/models/user_model.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/core/domain/services/locator.dart';
import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/values_manager.dart';
import 'package:dashboad/core/widgets/table/shimmer_table_row.dart';
import 'package:dashboad/core/widgets/table/table_header.dart';
import 'package:dashboad/core/widgets/table/table_row.dart';
import 'package:dashboad/features/laboratory/presentation/cubits/lab_master_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaboratoriesList extends StatelessWidget {
  const LaboratoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LabMasterCubit(getIt())..getLabMasters(),
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
              BlocBuilder<LabMasterCubit, LabMasterState>(
                  buildWhen: (previous, current) {
                if (current is GetLabMasterLoadingState) {
                  return true;
                } else if (current is GetLabMasterSuccessState) {
                  return true;
                } else if (current is GetLabMasterErrorState) {
                  return true;
                } else if (current is DeleteLabMasterSuccessState) {
                  return true;
                } else {
                  return false;
                }
              }, builder: (context, state) {
                if (state is GetLabMasterErrorState) {
                  return Text(NetworkExceptions.getErrorMessage(state.error));
                } else if (state is GetLabMasterLoadingState) {
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => const ShimmerTableRow(),
                      itemCount: 10,
                    ),
                  );
                } else if (state is GetLabMasterSuccessState) {
                  return _buildTable(state.labMasters);
                } else if (state is DeleteLabMasterSuccessState) {
                  return _buildTable(state.labMasters);
                } else {
                  return const SizedBox();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTable(List<UserModel> labMasters) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => MyTableRow(
          user: labMasters[index],
          onEditPressed: () {},
          onRemovePressed: () {
            BlocProvider.of<LabMasterCubit>(context)
                .deleteLabMaster(context, labMasters[index].id);
          },
        ),
        itemCount: labMasters.length,
      ),
    );
  }
}
