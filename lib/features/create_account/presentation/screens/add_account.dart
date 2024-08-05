import 'package:dashboad/features/create_account/presentation/cubits/add_account_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/domain/services/locator.dart';
import '../../../../core/utils/style_manager.dart';
import '../../../../core/widgets/toast_bar.dart';
import '../../domain/repository/create_repo.dart';
import '../cubits/add_account_states.dart';
import '../widgets/base_container.dart';
import '../widgets/text_animated_widget.dart';

class AddAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CreateRepo createRepo;
    return BlocProvider(
        create: (BuildContext context) => AddAccountCubit(getIt(),getIt())..getSection(),
        child: BlocConsumer<AddAccountCubit, AddAccountStates>(
          listener: (BuildContext context, state) {
            if (state is Success_Create_Patient) {
              ToastBar.onSuccess(
                context,
                message: 'The Patient Account has Created Successfully',
                title: "Success",
              );
            }
            if (state is Error_Create_Patient) {
              ToastBar.onNetworkFailure(context, networkException: state.error);
            }
            if (state is Success_Create_User) {
              ToastBar.onSuccess(
                context,
                message: 'The User Account has Created Successfully',
                title: "Success",
              );
            }
            if (state is Error_Create_User) {
              ToastBar.onNetworkFailure(context, networkException: state.error);
            }
            if (state is Success_Create_Doctor) {
              ToastBar.onSuccess(
                context,
                message: 'The Doctor Account has Created Successfully',
                title: "Success",
              );
            }
            if (state is Error_Create_Doctor) {
              ToastBar.onNetworkFailure(context, networkException: state.error);
            }
          },
          builder: (BuildContext context, state) {
            AddAccountCubit cubit = AddAccountCubit.get(context);
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
                child: Column(
                  children: [
                    Container(
                      height: 150.h,
                      decoration: StyleManager.rounded40(color: Colors.white),
                      child: Text_Animated_Row(cubit: cubit),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    BaseContainer(cubit: cubit)
                  ],
                ));
          },
        ));
  }
}
