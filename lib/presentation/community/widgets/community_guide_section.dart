import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:thuri_cycle/application/community/community_guides/community_guides_cubit.dart';
import 'package:thuri_cycle/domain/community/guide/guide.dart';
import 'package:thuri_cycle/infastructure/core/firebase_config/firebase_failure_handler.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/community/widgets/article_widgets/theme/src/app_text_styles.dart';
import 'package:thuri_cycle/presentation/community/widgets/guide_widgets/guide_widget.dart';
import 'package:thuri_cycle/presentation/community/widgets/guide_widgets/guide_widget_skeleton.dart';
import 'package:thuri_cycle/router.gr.dart';

//TODO: Add tip section
class CommunityGuidesSection extends StatelessWidget {
  const CommunityGuidesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            context.l10n.recycling101,
            style: AppTextStyles.blackBlack22.copyWith(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(height: 10),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: BlocBuilder<CommunityGuidesCubit, CommunityGuidesState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              return SizedBox(
                key: ValueKey(state),
                height: 190,
                width: MediaQuery.of(context).size.width,
                child: state.maybeWhen(
                  orElse: Container.new,
                  loading: () => MasonryGridView.count(
                    shrinkWrap: true,
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    scrollDirection: Axis.horizontal,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    crossAxisCount: 2,
                    itemCount: 4,
                    itemBuilder: (context, index) =>
                        const GuideWidgetSkeleton(),
                  ),
                  failed: (e) => Center(child: Text(mapFailureToMessage(e))),
                  success: (guides) => MasonryGridView.count(
                    shrinkWrap: true,
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    scrollDirection: Axis.horizontal,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    crossAxisCount: 2,
                    itemCount: guides.length,
                    itemBuilder: (context, index) => GuideWidget(
                      guide: guides[index],
                      onTap: (Guide guide) async {
                        await context.router.push(
                          SingleGuideRoute(guide: guide),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
