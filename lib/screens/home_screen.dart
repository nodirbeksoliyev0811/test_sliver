import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/images.dart';
import 'widgets/horizontal_header_view.dart';
import 'widgets/horizontal_menu_view.dart';
import 'widgets/liner_progres_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = (MediaQuery.of(context).size.height) / 812;
    double width = (MediaQuery.of(context).size.width) / 375;
    return Scaffold(
      backgroundColor: AppColors.c111015,
      appBar: AppBar(
        title: Text(
          "Привет, Максим",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 24 * width,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: AppColors.c111015,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5 * width),
            child: ZoomTapAnimation(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(4 * width),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5 * width, color: Colors.white),
                ),
                child: const Center(
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15 * width),
            child: ZoomTapAnimation(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5 * width, color: Colors.white),
                ),
                child: Center(
                  child: Image.asset(
                    AppImages.user,
                    width: 33*width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
              padding: const EdgeInsets.all(0),
              sliver: SliverPersistentHeader(
                delegate: LinerProgressView(),
                pinned: true,
              )),
          SliverPadding(
            padding: const EdgeInsets.all(0),
            sliver: SliverPersistentHeader(
              delegate: ExampleHeaderView(),
              pinned: true,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(0),
            sliver: SliverPersistentHeader(
              delegate: HorizontalMenuView(),
              pinned: true,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10 * width),
                      color: AppColors.c22222A,
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.all(10 * width),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(images[index], fit: BoxFit.fill),
                          Text(
                            title[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18 * width,
                              fontWeight: FontWeight.w500,
                            ),
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
                              const Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10 * width, vertical: 8*height),
                                decoration: BoxDecoration(
                                  color: AppColors.c111015,
                                  borderRadius: BorderRadius.circular(15 * width),
                                ),
                                child: Center(
                                  child: Text(
                                    weight[index],
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10 * width,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5 * width),
                              ZoomTapAnimation(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.all(10 * width),
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [AppColors.cE1D24A, AppColors.cC69233],
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text("+", style: TextStyle(fontSize: 25 * width, color: Colors.white)),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                childCount: title.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10 * width,
                crossAxisSpacing: 10 * width,
                childAspectRatio: 0.6,
              ),
            ),
          ),
          SliverPadding(padding: EdgeInsets.symmetric(vertical: 10 * height)),
        ],
      ),
    );
  }
}
