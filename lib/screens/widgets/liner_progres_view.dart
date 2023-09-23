import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../utils/colors.dart';

class LinerProgressView extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    double height = (MediaQuery.of(context).size.height) / 812;
    double width = (MediaQuery.of(context).size.width) / 375;
    return Stack(
      children: [
        Container(width: double.infinity, color: AppColors.c111015),
        Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20 * width),
              width: double.infinity,
              height: 7 * height,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.cE1D24A, AppColors.cC69233],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: 20 * height),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20 * width),
              child: Row(
                children: [
                  Text(
                    "Ваши любимые товары",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16 * width,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  ZoomTapAnimation(
                    onTap: () {},
                    child: Text(
                      "Посмотреть все",
                      style: TextStyle(
                        color: AppColors.cE1D24A,
                        fontSize: 14 * width,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
