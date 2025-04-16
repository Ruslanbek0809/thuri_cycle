import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/shortcuts.dart';
import 'package:universal_platform/universal_platform.dart';

class ProfilePageShimmer extends StatelessWidget {
  const ProfilePageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _shimmerHeader(context),
          const Divider(),
          _shimmerProfileItem(context),
          _shimmerProfileItem(context),
          _shimmerProfileItem(context),
          //*------------------ PROFILE SUBSCRIPTION CARD ---------------------//
          if (UniversalPlatform.isAndroid)
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: $constants.insets.sm),
              child: Shimmer.fromColors(
                baseColor: $constants.palette.shimmerMain,
                highlightColor: $constants.palette.white,
                child: Container(
                  height: getSize(context).height * 0.185,
                  width: getSize(context).width,
                  decoration: BoxDecoration(
                    color: $constants.palette.white,
                    borderRadius: BorderRadius.circular($constants.corners.xl),
                  ),
                ),
              ),
            ),
          _shimmerProfileItem(context),
          _shimmerProfileItem(context),
          _shimmerProfileItem(context),
          _shimmerProfileItem(context),
        ],
      ),
    );
  }

  Widget _shimmerHeader(BuildContext context) {
    final safeTopPadding = MediaQuery.of(context).padding.top;
    return Padding(
      padding: EdgeInsets.only(bottom: $constants.insets.sm),
      child: Stack(
        children: [
          Column(
            children: [
              //*------------------ PROFILE USER BACKGROUND / PROFILE USER TYPE ---------------------//
              Stack(
                children: [
                  Shimmer.fromColors(
                    baseColor: $constants.palette.shimmerMain,
                    highlightColor: $constants.palette.white,
                    child: Container(
                      height: getSize(context).height * 0.2,
                      width: getSize(context).width,
                      decoration: BoxDecoration(
                        color: $constants.palette.white,
                        borderRadius:
                            BorderRadius.circular($constants.corners.md),
                      ),
                    ),
                  ),
                  Positioned(
                    right: $constants.insets.sm,
                    bottom: $constants.insets.sm,
                    child: Shimmer.fromColors(
                      baseColor: $constants.palette.shimmerSecondary,
                      highlightColor: $constants.palette.white,
                      child: Container(
                        width: 80,
                        height: 28,
                        decoration: BoxDecoration(
                          color: $constants.palette.white,
                          borderRadius:
                              BorderRadius.circular($constants.corners.sm + 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //*------------------ PROFILE USER INFO / ADDITIONALS ---------------------//
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: $constants.insets.sm),
                child: Column(
                  children: [
                    SizedBox(
                      height: $constants.insets.lg +
                          $constants.insets.xs +
                          $constants.insets.xxs,
                    ),
                    Shimmer.fromColors(
                      baseColor: $constants.palette.shimmerMain,
                      highlightColor: $constants.palette.white,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: getSize(context).width / 2 +
                              (($constants.insets.sm + 4) * 2),
                          height: 14,
                          decoration: BoxDecoration(
                            color: $constants.palette.white,
                            borderRadius: BorderRadius.circular(
                              $constants.corners.sm - 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: $constants.insets.sm - 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              _shimmerAdditionalBox(context),
                              SizedBox(width: $constants.insets.md),
                              _shimmerAdditionalBox(context),
                              SizedBox(width: $constants.insets.md),
                              _shimmerAdditionalBox(context),
                            ],
                          ),
                        ),
                        Shimmer.fromColors(
                          baseColor: $constants.palette.shimmerSecondary,
                          highlightColor: $constants.palette.white,
                          child: Container(
                            width: 36,
                            height: 30,
                            decoration: BoxDecoration(
                              color: $constants.palette.white,
                              borderRadius:
                                  BorderRadius.circular($constants.corners.md),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: getSize(context).height * 0.2 - 60,
            left: $constants.insets.sm,
            child: Shimmer.fromColors(
              baseColor: $constants.palette.shimmerSecondary,
              highlightColor: $constants.palette.white,
              child: Container(
                width: 85,
                height: 85,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: $constants.palette.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: safeTopPadding + $constants.insets.sm,
            right: $constants.insets.sm,
            child: Shimmer.fromColors(
              baseColor: $constants.palette.shimmerSecondary,
              highlightColor: $constants.palette.white,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: $constants.palette.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _shimmerAdditionalBox(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: $constants.palette.shimmerMain,
      highlightColor: $constants.palette.white,
      child: Column(
        children: [
          Container(
            width: 34,
            height: 16,
            decoration: BoxDecoration(
              color: $constants.palette.white,
              borderRadius: BorderRadius.circular(
                $constants.corners.sm - 1,
              ),
            ),
          ),
          SizedBox(height: $constants.insets.xs + 2),
          Container(
            width: 56,
            height: 16,
            decoration: BoxDecoration(
              color: $constants.palette.white,
              borderRadius: BorderRadius.circular(
                $constants.corners.sm - 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _shimmerProfileItem(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: $constants.insets.sm,
        vertical: $constants.insets.sm,
      ),
      child: Row(
        children: [
          Shimmer.fromColors(
            baseColor: $constants.palette.shimmerSecondary,
            highlightColor: $constants.palette.white,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: $constants.palette.white,
                borderRadius: BorderRadius.circular($constants.corners.md),
              ),
            ),
          ),
          SizedBox(width: $constants.insets.sm),
          Expanded(
            child: Shimmer.fromColors(
              baseColor: $constants.palette.shimmerMain,
              highlightColor: $constants.palette.white,
              child: Container(
                width: double.infinity,
                height: 16,
                decoration: BoxDecoration(
                  color: $constants.palette.white,
                  borderRadius: BorderRadius.circular($constants.corners.sm),
                ),
              ),
            ),
          ),
          SizedBox(width: $constants.insets.sm),
          Shimmer.fromColors(
            baseColor: $constants.palette.shimmerSecondary,
            highlightColor: $constants.palette.white,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: $constants.palette.white,
                borderRadius: BorderRadius.circular($constants.corners.md),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
