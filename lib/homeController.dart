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
    // int result = await audioPlayer.play(alarmAudioPath, isLocal: true);
    if (secs < 10) {
      progress = 0.0;
      int result = await audioPlayer.play(alarmAudioPath, isLocal: true);
    } else if (secs < 20 && secs >= 10) {
      progress = 0.2;
      int result = await audioPlayer.play(alarmAudioPath, isLocal: true);
    } else if (secs < 30 && secs >= 20) {
      progress = 0.4;
      int result = await audioPlayer.play(alarmAudioPath, isLocal: true);
    } else if (secs < 40 && secs >= 30) {
      progress = 0.6;
      int result = await audioPlayer.play(alarmAudioPath, isLocal: true);
    } else if (secs < 50 && secs >= 40) {
      progress = 0.8;
      int result = await audioPlayer.play(alarmAudioPath, isLocal: true);
    } else if (secs < 60 && secs >= 50) {
      progress = 1.0;
      int result = await audioPlayer.play(alarmAudioPath, isLocal: true);
    }
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
