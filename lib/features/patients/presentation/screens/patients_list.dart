import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/core/domain/services/locator.dart';
import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/values_manager.dart';
import 'package:dashboad/core/widgets/table/shimmer_table_row.dart';
import 'package:dashboad/core/widgets/table/table_header.dart';
import 'package:dashboad/core/widgets/table/table_row.dart';
import 'package:dashboad/features/patients/data/models/patient_model.dart';
import 'package:dashboad/features/patients/presentation/cubits/patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../drawer_basiclayout/presentation/screens/baselayout.dart';

class PatientsList extends StatelessWidget {
  const PatientsList({super.key});

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
              BlocBuilder<PatientCubit, PatientState>(
                  buildWhen: (previous, current) {
                if (current is GetPatientsLoadingState) {
                  return true;
                } else if (current is GetPatientSuccessState) {
                  return true;
                } else if (current is GetPatientsErrorState) {
                  return true;
                } else if (current is DeletePatientSuccessState) {
                  return true;
                } else {
                  return false;
                }
              }, builder: (context, state) {
                if (state is GetPatientsErrorState) {
                  return Text(NetworkExceptions.getErrorMessage(state.error));
                } else if (state is GetPatientsLoadingState) {
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) =>
                          const ShimmerTableRow(),
                      itemCount: 10,
                    ),
                  );
                } else if (state is GetPatientSuccessState) {
                  return _buildTable(state.patients);
                } else if (state is DeletePatientSuccessState) {
                  return _buildTable(state.patients);
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

  Widget _buildTable(List<PatientModel> patients) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => MyTableRow(
          user: patients[index].userData,
          onEditPressed: () {
            context.go('/Patients_List/Patient_profile/${patients[index].id}');
            PatientCubit.get(context).getPatientProfile(id: patients[index].id);
          },
          onRemovePressed: () {
            BlocProvider.of<PatientCubit>(context)
                .deletePatient(context, patients[index].id);
          },
        ),
        itemCount: patients.length,
      ),
    );
  }
}
