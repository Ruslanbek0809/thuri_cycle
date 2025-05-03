import 'package:flutter/material.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:thuri_cycle/domain/profile/language/language.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/helpers/bottom_sheet_language_card.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_bar_for_bottom_sheet.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({
    required this.originalLanguages,
    this.selectedLanguage,
    super.key,
  });

  final List<LanguageModel> originalLanguages;
  final LanguageModel? selectedLanguage;

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  List<LanguageModel> get originalLanguages => widget.originalLanguages;

  LanguageModel? get selectedLanguage => widget.selectedLanguage;

  late List<LanguageModel> languages;

  @override
  void initState() {
    languages = originalLanguages;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: getThemeData(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular($constants.corners.md * 2 + 4),
        ),
      ),
      child: SingleChildScrollView(
        controller: ModalScrollController.of(context),
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomBarForBottomSheet(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: $constants.insets.xs),
              child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: getTabletType() ? 56 : 28,
                    icon: Icon(Icons.close, color: $constants.palette.main),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    context.l10n.chooseYourLocatioin,
                    style: getTextTheme(context).titleMedium!.copyWith(
                          fontSize: responsiveFontSize(context, 18),
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: $constants.insets.sm + $constants.insets.xxs,
              ),
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).viewInsets.bottom) *
                  0.5,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: $constants.insets.sm),
                physics: const ClampingScrollPhysics(),
                itemCount: languages.length,
                itemBuilder: (BuildContext context, int index) =>
                    BottomSheetLanguageCard(
                  language: languages[index],
                  isSelected: selectedLanguage != null &&
                      languages[index].id == selectedLanguage!.id,
                  isNextItemExist: index != languages.length - 1,
                  onTap: (value) {
                    if (selectedLanguage != null &&
                        languages[index].id == selectedLanguage!.id) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context, value);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
