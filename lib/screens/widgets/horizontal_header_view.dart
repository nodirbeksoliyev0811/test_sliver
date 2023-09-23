import 'package:flutter/material.dart';
import 'package:test_sliver/utils/colors.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../utils/constants.dart';

class ExampleHeaderView extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    double height = (MediaQuery.of(context).size.height) / 812;
    double width = (MediaQuery.of(context).size.width) / 375;
    return Stack(
      children: [
        Container(width: double.infinity, color: AppColors.c111015),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: 10 * width),
              ...List.generate(
                title.length,
                (index) => Padding(
                  padding: EdgeInsets.all(10 * width),
                  child: Container(
                    padding: EdgeInsets.only(right: 15*width),
                    decoration: BoxDecoration(
                      color: AppColors.c22222A,
                      borderRadius: BorderRadius.circular(10 * width),
                    ),
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(images[index], height: 150 * width, width: 150 * width),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    title[index],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18 * width,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 32 * width),
                                  ZoomTapAnimation(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 30 * width,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                info[index],
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 11 * width,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    cost[index],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18 * width,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(width: 48 * width),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 12*width,vertical: 7*height),
                                    decoration: BoxDecoration(
                                      color: AppColors.c111015,
                                      borderRadius: BorderRadius.circular(15*width),
                                    ),
                                    child: Center(
                                      child: Text(
                                        weight[index],
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10*width,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5 * width),
                                  ZoomTapAnimation(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.all(6 * width),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(width: 1 * width, color: AppColors.cE1D24A),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.shopping_bag_rounded,
                                          color: AppColors.cE1D24A,
                                          size: 22*width,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  @override
  double get maxExtent => 165;

  @override
  double get minExtent => 20;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
