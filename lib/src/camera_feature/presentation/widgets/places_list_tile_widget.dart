import 'package:flutter/material.dart';
import 'package:mad_test_work/core/extensions/string_exttensions.dart';
import 'package:mad_test_work/src/camera_feature/domain/place/place.dart';
import 'package:mad_test_work/src/colors/app_colors.dart';
import 'package:mad_test_work/src/typography/app_typography.dart';
/// Builds a list tile widget for a [Place] with the given [freeSpaceNotifier] and optional [onTap] callback.
///
/// The list tile displays the [place.title] and the number of completed points for the place.
///
/// The list tile is displayed within a [Card] with a background color of [AppColors.listTileBackgroundColor].
/// When tapped, the optional [onTap] callback is invoked.

class PlacesListTileWidget extends StatelessWidget {
  final Place place;
  final ValueNotifier<double> freeSpaceNotifier;
  final VoidCallback? onTap;
  const PlacesListTileWidget({
    super.key,
    required this.place,
    required this.freeSpaceNotifier,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.listTileBackgroundColor,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  place.title,
                  style: AppTypography.m3TitleMedium,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Отснято сегодня:'.hardcoded,
                      style: AppTypography.m3labelSmall.copyWith(
                        color: AppColors.customTextSecond,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: place.points
                                .where((element) => element.isCompleted)
                                .length
                                .toString(),
                            style: AppTypography.m3BodyMedium,
                          ),
                          TextSpan(
                            text:
                                ' / ${place.points.length} доступно'.hardcoded,
                            style: AppTypography.m3labelSmall.copyWith(
                              color: AppColors.customTextSecond,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Съёмка займёт:'.hardcoded,
                      style: AppTypography.m3labelSmall.copyWith(
                        color: AppColors.customTextSecond,
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: freeSpaceNotifier,
                      builder:
                          (BuildContext context, double value, Widget? child) {
                        return RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                text: '${place.remainingSpace} ГБ'.hardcoded,
                                style: AppTypography.m3BodyMedium,
                              ),
                              TextSpan(
                                text: ' / $value ГБ'.hardcoded,
                                style: AppTypography.m3labelSmall.copyWith(
                                  color: AppColors.customTextSecond,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
