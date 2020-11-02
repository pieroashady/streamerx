// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:io';

import 'package:camera_with_rtmp/camera.dart';
import 'package:camera_with_rtmp_example/components/menu.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

Future<void> main() async {
  // Fetch the available cameras before initializing the app.

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false, title: 'BroadcastX', home: Menu()));
}
