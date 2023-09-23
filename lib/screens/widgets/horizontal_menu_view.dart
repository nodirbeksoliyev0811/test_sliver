import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';

class HorizontalMenuView extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    double width = (MediaQuery.of(context).size.width) / 375;
    int currentIndex = 0;
    return Stack(
      children: [
        Container(width: double.infinity, color: AppColors.c111015),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20 * width),
              child: Row(
                children: [
                  Text(
                    "Все товары",
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
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 15 * width),
                  ...List.generate(
                    menu.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 10 * width, horizontal: 5 * width),
                      child: Expanded(
                        child: ZoomTapAnimation(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(8 * width),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  index == currentIndex ? AppColors.cE1D24A : AppColors.c22222A,
                                  index == currentIndex ? AppColors.cC69233 : AppColors.c22222A,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(10 * width),
                            ),
                            child: Center(
                              child: Text(
                                menu[index],
                                style: TextStyle(color: index == 0 ? AppColors.black : AppColors.white),
                              ),
                            ),
                          ),
                        ),
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
  double get maxExtent => 70;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
