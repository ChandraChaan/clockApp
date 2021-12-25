import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homeController.dart';

class clockTimer extends StatelessWidget {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    controller.hour.toString() +
                        ":" +
                        controller.mint.toString() +
                        ":" +
                        controller.secs.toString(),
                    style: TextStyle(fontSize: 56),
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        height: 300,
                        width: 300,
                        child: CircularProgressIndicator(
                          color: controller.color,
                          value: controller.progress,
                          strokeWidth: 5,
                        ))),
              ],
            ),
          ),
        );
      }),
    );
  }
}
