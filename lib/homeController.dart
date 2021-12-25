import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  AudioPlayer audioPlayer = AudioPlayer();
  static const alarmAudioPath = "assets/audios/sec_tone.mp3";

  var rnd = Random();

  var hour = DateTime.now().hour.obs;
  var mint = DateTime.now().minute.obs;
  var secs = DateTime.now().second.obs;
  bool sizebig = false;
  var counter = 0.obs;
  Color color = Color(0xfffff);
  double progress = 0.0;

  callIncrement() async {
    hour.value = DateTime.now().hour;
    mint.value = DateTime.now().minute;
    secs.value = DateTime.now().second;
    // counter += 1;
    // sizebig != sizebig;
    if (secs > 58)
      int result = await audioPlayer.play(alarmAudioPath, isLocal: true);
    progress = (secs / 60);
    var r = rnd.nextInt(16) * 16;
    var g = rnd.nextInt(16) * 16;
    var b = rnd.nextInt(16) * 16;
    color = Color.fromARGB(255, r, g, b);
  }

  @override
  void onInit() {
    Timer.periodic(Duration(seconds: 1), (_) => callIncrement());
    super.onInit();
  }
}
