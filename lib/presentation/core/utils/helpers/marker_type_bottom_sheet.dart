import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/helpers/bottom_sheet_marker_type_card.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';
import 'package:thuri_cycle/presentation/core/widgets/custom/custom_bar_for_bottom_sheet.dart';

class MarkerTypeBottomSheet extends StatefulWidget {
  const MarkerTypeBottomSheet({
    required this.markerTypes,
    this.selectedMarkerType,
    super.key,
  });

  final List<MarkerType> markerTypes;
  final MarkerType? selectedMarkerType;

  @override
  State<MarkerTypeBottomSheet> createState() => _MarkerTypeBottomSheetState();
}

class _MarkerTypeBottomSheetState extends State<MarkerTypeBottomSheet> {
  MarkerType? get selectedCountry => widget.selectedMarkerType;

  late List<MarkerType> markerTypeValues;

  @override
  void initState() {
    markerTypeValues = widget.markerTypes;
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
                    icon: Icon(
                      Icons.close,
                      color: $constants.palette.main,
                    ),
                    onPressed: () {
                      Navigator.pop(
                        context,
                      );
                    },
                  ),
                  Text(
                    context.l10n.selectWasteType,
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
                itemCount: markerTypeValues.length,
                itemBuilder: (BuildContext context, int index) =>
                    BottomSheetMarkerTypeCard(
                  markerType: markerTypeValues[index],
                  isSelected: selectedCountry != null &&
                      markerTypeValues[index].id == selectedCountry!.id,
                  isNextItemExist: index != markerTypeValues.length - 1,
                  onTap: (value) {
                    if (selectedCountry != null &&
                        markerTypeValues[index].id == selectedCountry!.id) {
                      Navigator.pop(
                        context,
                      );
                    } else {
                      Navigator.pop(
                        context,
                        value,
                      );
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
