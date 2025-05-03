import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:thuri_cycle/domain/profile/language/language.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/helpers/language_bottom_sheet.dart';
import 'package:thuri_cycle/presentation/core/utils/helpers/marker_type_bottom_sheet.dart';

@immutable
abstract class BottomSheetHelper {
  const BottomSheetHelper._();

  static Future<MarkerType?> showMarkerTypesSheet(
    BuildContext context,
    List<MarkerType> markerTypes,
    MarkerType? selectedMarkerType,
  ) {
    return showMaterialModalBottomSheet<MarkerType>(
      context: context,
      builder: (context) => MarkerTypeBottomSheet(
        markerTypes: markerTypes,
        selectedMarkerType: selectedMarkerType,
      ),
    );
  }

  static Future<LanguageModel?> showLanguagesSheet(
    BuildContext context,
    List<LanguageModel> languages,
    LanguageModel? selectedLanguage,
  ) {
    return showMaterialModalBottomSheet<LanguageModel>(
      context: context,
      builder: (context) => LanguageBottomSheet(
        originalLanguages: languages,
        selectedLanguage: selectedLanguage,
      ),
    );
  }
}
