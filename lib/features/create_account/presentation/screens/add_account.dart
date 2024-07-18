import 'package:dashboad/features/create_account/presentation/cubits/add_account_cubit.dart';
import 'package:dashboad/features/drawer_basiclayout/presentation/screens/baselayout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/domain/services/locator.dart';
import '../../../../core/utils/style_manager.dart';
import '../../domain/repository/create_repo.dart';
import '../cubits/add_account_states.dart';
import '../widgets/base_container.dart';
import '../widgets/basic_columns/fromfield_column.dart';
import '../widgets/basic_columns/role_image_column.dart';
import '../widgets/text_animated_widget.dart';

class AddAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CreateRepo createRepo;
    return BlocProvider(
        create: (BuildContext context) => AddAccountCubit(getIt()),
        child: BlocConsumer<AddAccountCubit, AddAccountStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, state) {
            AddAccountCubit cubit = AddAccountCubit.get(context);
            return BaseLayout(
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
                    child: Column(
                      children: [
                        Container(
                          height: 150.h,
                          decoration:
                              StyleManager.rounded40(color: Colors.white),
                          child: Text_Animated_Row(cubit: cubit),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        BaseContainer(cubit: cubit)
                      ],
                    )));
          },
        ));
  }
}
