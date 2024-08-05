import 'package:dashboad/core/helpers/dimensions_helper.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../core/helpers/colors_helper.dart';
import '../../../../core/utils/values_manager.dart';

class TestAppointment extends StatelessWidget {
  const TestAppointment({super.key});

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
            Row(
              children: [
                Image.asset(
                  'assets/images/2.jpg',
                  height: DimensionsHelper.heightPercentage(context, 20),
                 // width: DimensionsHelper.widthPercentage(context, 80),
                ),
                const SizedBox(
                  width: 50,
                ),
                Text('Appointments and Schedule:', style: StyleManager.font30Bold_Lobster,)
              ],
            ),
            Expanded(
              child: AnimationLimiter(
                  child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(
                    66,
                    (index) => AnimationConfiguration.staggeredGrid(
                        duration: const Duration(milliseconds: 1500),
                        position: index,
                        columnCount: 2,
                        child: FadeInAnimation(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Card(
                              elevation: 4,
                              margin:const EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Image.asset(
                                      'assets/images/appointment_background.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black.withOpacity(0.5),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      bottom: 20,
                                      left: 20,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Doctor name',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            'Section',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'Patient: ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            'Date: 10/10/24',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            'Time: 10:45 pm',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            // Container(
                            //     color: Colors.blue,
                            //     child: Center(child: Text('animation'))),
                          ),
                        ))),
              )),
            )
          ],
        ),
      ),
    );
  }
}
