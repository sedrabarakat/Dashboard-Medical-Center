import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/core/domain/services/locator.dart';
import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/values_manager.dart';
import 'package:dashboad/features/doctors/data/model/doctor_model.dart';
import 'package:dashboad/features/doctors/presentation/cubits/doctor_cubit.dart';
import 'package:dashboad/core/widgets/table/shimmer_table_row.dart';
import 'package:dashboad/core/widgets/table/table_header.dart';
import 'package:dashboad/core/widgets/table/table_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            BlocBuilder<DoctorCubit, DoctorState>(
                buildWhen: (previous, current) {
              if (current is GetDoctorsLoadingState) {
                return true;
              } else if (current is GetDoctorsSuccessState) {
                return true;
              } else if (current is GetDoctorsErrorState) {
                return true;
              } else if (current is DeleteDoctorSuccessState) {
                return true;
              } else {
                return false;
              }
            }, builder: (context, state) {
              if (state is GetDoctorsErrorState) {
                return Text(NetworkExceptions.getErrorMessage(state.error));
              } else if (state is GetDoctorsLoadingState) {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) =>
                        const ShimmerTableRow(),
                    itemCount: 10,
                  ),
                );
              } else if (state is GetDoctorsSuccessState) {
                return _buildTable(state.doctors);
              } else if (state is DeleteDoctorSuccessState) {
                return _buildTable(state.directors);
              } else {
                return const SizedBox();
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildTable(List<DoctorModel> doctors) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => MyTableRow(
          user: doctors[index].userData,
          onEditPressed: () {
            context.go('/Doctors_List/Doctor_profile/${doctors[index].id}');
          },
          onRemovePressed: () {
            BlocProvider.of<DoctorCubit>(context)
                .deleteDoctors(context, doctors[index].id);
          },
        ),
        itemCount: doctors.length,
      ),
    );
  }
}
