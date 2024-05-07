import 'package:flutter/material.dart';
import 'package:mad_test_work/core/extensions/string_exttensions.dart';
import 'package:mad_test_work/src/camera_feature/presentation/widgets/search_text_field.dart';
import 'package:mad_test_work/src/colors/app_colors.dart';
import 'package:mad_test_work/src/typography/app_typography.dart';

/// Represents a [SliverPersistentHeaderDelegate] that displays a customized app bar
/// with a search text field and other UI elements.
///
/// The [PlacesSliverAppBar] is responsible for rendering the app bar in a scrollable
/// context, such as a [CustomScrollView]. It provides a callback to notify when the
/// search text changes.
///
/// The app bar's appearance and behavior changes based on the scroll offset, with
/// the search text field appearing at the bottom when the app bar is collapsed.
class PlacesSliverAppBar extends SliverPersistentHeaderDelegate {
  // Callback to notify when the search text changes
  final Function(String value)? onChanged;
  PlacesSliverAppBar({
    required this.onChanged,
  });
  bool needRebuild = true;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final small = shrinkOffset < 40;
    final bottomOpacity = (12 / shrinkOffset).clamp(0, 1.0).toDouble();
    final toolbarOpacity =
        ((shrinkOffset - 40) / 10).abs().clamp(-1.0, 1.0).toDouble();
    return AppBar(
      toolbarHeight: 160,
      toolbarOpacity: toolbarOpacity,
      leading: small
          ? null
          : const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Text(
          'Объекты'.hardcoded,
          style: AppTypography.m3BodyLarge,
        ),
      ),
      centerTitle: small ? false : true,
      actions: small
          ? null
          : const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.info_outline),
              )
            ],
      backgroundColor:
          small ? AppColors.background : AppColors.listTileBackgroundColor,
      leadingWidth: small ? null : 64,
      bottom: small
          ? SearchTextField(
              onChanged: onChanged,
            )
          : null,
      bottomOpacity: bottomOpacity,
    );
  }

  @override
  double get maxExtent => 140;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
