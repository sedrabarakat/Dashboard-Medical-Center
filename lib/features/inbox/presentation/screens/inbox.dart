import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:dashboad/core/widgets/animated_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/domain/services/locator.dart';
import '../cubits/inbox.dart';
import '../cubits/inbox_states.dart';
import '../widgets/inbox_list.dart';
import '../widgets/inbox_widget.dart';


class Inbox extends StatelessWidget{
  const Inbox({super.key});


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (context)=>inbox_cubit(getIt())..getInbox(),
        child: BlocConsumer<inbox_cubit,inbox_states>(
          listener: (context,state){},
          builder: (context,state){
            inbox_cubit cubit=inbox_cubit.get(context);
            return Container(
              width: 900.w,color: ColorsHelper.basicBackground,
              child:  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
                  child: Column(
                    children: [
                      Inboxwidget(),
                      SizedBox(
                        height: 40.h,
                      ),
                      inbox_list(context: context)
                    ],
                  ))
            );
          },
        )
    );
  }
}
