import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/helpers/responsive_helper.dart';
import 'package:dashboad/core/routing/go_router.dart';
import 'package:dashboad/core/utils/assets_manager.dart';
import 'package:dashboad/core/utils/values_manager.dart';
import 'package:dashboad/features/auth/presentation/cubits/cubit/auth_cubit.dart';
import 'package:dashboad/features/auth/presentation/widgets/login_card.dart';
import 'package:dashboad/features/auth/presentation/widgets/otp_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

// Todo fix the height problem
// Todo try to make the performance better
// Todo add the validator for the phoneNumber and password

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
            requestCodeSuccess: () =>
                BlocProvider.of<AuthCubit>(context).pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    ),
            verfiyCodeSuccess: () =>
                context.pushReplacementNamed(WebRouter.kAddAccount),
          );
        },
        child: Stack(
          children: [
            /*>>>> Background Image <<<<*/
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              child: SvgPicture.asset(
                AssetsManager.loginBackgroundImage,
                fit: BoxFit.fill,
              ),
            ),
            /*>>>> Background Image <<<<*/

            /**************************************************************************************/
            Row(
              children: [
                /*Login Image */
                Visibility(
                  visible: isDesktop,
                  child: Expanded(
                    child: SvgPicture.asset(
                      AssetsManager.loginImage,
                      width: MediaQuery.sizeOf(context).width,
                    ),
                  ),
                ),
                /*Login Image */

                /**************************************************************************************/
                Expanded(
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
                          color: isMobile ? Colors.transparent : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: isDesktop
                              ? MediaQuery.sizeOf(context).width * .3
                              : isTablet
                                  ? MediaQuery.sizeOf(context).width * .7
                                  : MediaQuery.sizeOf(context).width,
                          maxHeight: isMobile
                              ? MediaQuery.sizeOf(context).height
                              : 500,
                        ),
                        child: PageView(
                          controller: BlocProvider.of<AuthCubit>(context)
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
                                await BlocProvider.of<AuthCubit>(context)
                                    .requestCode(context);
                              },
                            ),
                            OtpCard(
                              textColor: isMobile
                                  ? ColorsHelper.white
                                  : ColorsHelper.black,
                              onPressed: () async {
                                await BlocProvider.of<AuthCubit>(context)
                                    .verfiyCode(context);
                              },
                              onCompleted: (otpCode) {
                                BlocProvider.of<AuthCubit>(context).otpCode =
                                    otpCode;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
