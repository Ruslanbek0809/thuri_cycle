import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutCardWidget extends StatelessWidget {
  const AboutCardWidget({
    required this.description,
    required this.svgAssetPath,
    required this.urlString,
    super.key,
  });
  final String description;
  final String svgAssetPath;
  final String urlString;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: InkWell(
        onTap: () {
          launchUrlString(urlString);
        },
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              const SizedBox(width: 16),
              SvgPicture.asset(
                svgAssetPath,
                width: min(MediaQuery.of(context).size.width / 5, 128),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
