import 'package:dashboad/core/data/datasources/local.dart';
import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/helpers/dimensions_helper.dart';
import 'package:dashboad/core/helpers/responsive_helper.dart';
import 'package:dashboad/core/utils/assets_manager.dart';
import 'package:dashboad/core/utils/values_manager.dart';
import 'package:dashboad/features/auth/presentation/cubits/cubit/auth_cubit.dart';
import 'package:dashboad/features/auth/presentation/widgets/login_card.dart';
import 'package:dashboad/features/auth/presentation/widgets/otp_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/toast_bar.dart';

// Todo try to make the performance better
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveHelper.isMobile(context);
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    bool isTablet = ResponsiveHelper.isTablet(context);
    return Scaffold(
      backgroundColor: ColorsHelper.basicBackground,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            // snackbar & Go to the otp card
            requestCodeSuccess: () {
              BlocProvider.of<AuthCubit>(context).pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
              ToastBar.onSuccess(
                context,
                message: 'the code has been sent successfully',
                title: "Success",
              );
            },
            requestCodeError: (error) {
              ToastBar.onNetworkFailure(context, networkException: error);
            },
            // snackbar & Navigate to the add account screen when the otp code is right
            verfiyCodeSuccess: () {
              ToastBar.onSuccess(
                context,
                message: "Welcome Back",
                title: 'Success',
              );

              SharedPrefrence.getData(key: "role") == 'owner'
                  ? context.go('/add_account')
                  : context.go('/Doctors_List');
            },
            verfiyCodeError: (error) {
              ToastBar.onNetworkFailure(context, networkException: error);
            },
          );
        },
        child: Stack(
          children: [
            /*>>>> Background Image <<<<*/
            SizedBox(
              width: DimensionsHelper.screenWidth(context),
              height: DimensionsHelper.screenHeight(context),
              child: SvgPicture.asset(
                AssetsManager.loginBackgroundImage,
                fit: BoxFit.fill,
              ),
            ),
            /*>>>> Background Image <<<<*/

            /**************************************************************************************/
            SizedBox(
              // To take the full height of the screen
              height: double.infinity,
              child: Row(
                children: [
                  /*Login Image */
                  Visibility(
                    visible: isDesktop,
                    child: SvgPicture.asset(
                      AssetsManager.loginImage,
                      width: MediaQuery.sizeOf(context).width * .5,
                    ),
                  ),
                  /*Login Image */

                  /**************************************************************************************/
                  Expanded(
                    // the scroll here for prevent overflow when the height is less
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(AppPadding.p50),
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                  spreadRadius: .5,
                                )
                              ],
                              color:
                                  isMobile ? Colors.transparent : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            constraints: BoxConstraints(
                              maxWidth: isDesktop
                                  ? DimensionsHelper.widthPercentage(
                                      context, 30)
                                  : isTablet
                                      ? DimensionsHelper.widthPercentage(
                                          context, 70)
                                      : DimensionsHelper.screenWidth(context),
                              maxHeight: isMobile
                                  ? DimensionsHelper.screenHeight(context)
                                  : 500,
                            ),
                            child: BlocBuilder<AuthCubit, AuthState>(
                              builder: (context, state) {
                                return PageView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  controller:
                                      BlocProvider.of<AuthCubit>(context)
                                          .pageController,
                                  children: [
                                    LoginCard(
                                      phoneNumberController:
                                          BlocProvider.of<AuthCubit>(context)
                                              .phoneNumberController,
                                      passwordController:
                                          BlocProvider.of<AuthCubit>(context)
                                              .passwordController,
                                      textColor: isMobile
                                          ? ColorsHelper.white
                                          : ColorsHelper.black,
                                      onPressed: () async {
                                        await BlocProvider.of<AuthCubit>(
                                                context)
                                            .requestCode(context);
                                      },
                                      buttonCurrentState:
                                          BlocProvider.of<AuthCubit>(context)
                                              .loginButtonState,
                                    ),
                                    OtpCard(
                                      timerDuration: Duration(
                                        seconds:
                                            BlocProvider.of<AuthCubit>(context)
                                                .timerSeconds,
                                      ),
                                      buttonCurrentState:
                                          BlocProvider.of<AuthCubit>(context)
                                              .otpButtonState,
                                      textColor: isMobile
                                          ? ColorsHelper.white
                                          : ColorsHelper.black,
                                      onPressed: () async {
                                        await BlocProvider.of<AuthCubit>(
                                                context)
                                            .verfiyCode(context);
                                      },
                                      onCompleted: (otpCode) async {
                                        BlocProvider.of<AuthCubit>(context)
                                            .otpCode = otpCode;
                                        await BlocProvider.of<AuthCubit>(
                                                context)
                                            .verfiyCode(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
