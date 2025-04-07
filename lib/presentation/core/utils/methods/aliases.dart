import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:thuri_cycle/infastructure/core/dependency_injection/di.dart';

final talker = getIt<Talker>();

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();