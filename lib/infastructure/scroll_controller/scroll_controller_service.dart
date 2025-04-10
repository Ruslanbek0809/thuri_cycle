import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ScrollControllerService {
  final ScrollController homeScrollController = ScrollController();
  final ScrollController reportWastaScrollController = ScrollController();
  final ScrollController profileScrollController = ScrollController();

  // Injectable will call this automatically when you reset or shut down GetIt:
  @disposeMethod
  void dispose() {
    homeScrollController.dispose();
    reportWastaScrollController.dispose();
    profileScrollController.dispose();
  }
}

//TODO: Use below lines in respective pages to implement ScrollControllerService fully
// final scrollService = getIt<ScrollControllerService>();

// // Use it:
// controller: scrollService.homeScrollController