import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikn_codes_machin_test/src/controlls/home_controller.dart';
import 'package:vikn_codes_machin_test/util/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();

 @override
  void initState() {
    super.initState();
    Get.find<HomeController>().getsaleList(1);

    scrollController.addListener(() {
      final controller = Get.find<HomeController>();

      if (scrollController.position.pixels == scrollController.position.maxScrollExtent &&
          !controller.isLoading &&
          controller.salelist != null ) {
        print('Fetching more data...');
        controller.setsaleOffset(controller.pageoffset + 1);
        controller.showBottomLoader();
        controller.getsaleList(controller.pageoffset);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: scrollController,
          physics: AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Colors.blue,
                    size: 27,
                  ),
                )
              ],
              leading: IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.arrow_left),
              ),
              automaticallyImplyLeading: false,
              title: Text(
                'Sales Estimate',
                style: poppinsRegular,
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverDelegate(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: poppinsRegular,
                    suffixIcon: Icon(
                      CupertinoIcons.search,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
                    ),
                    fillColor: Color(0xFFFBFBFB),
                    filled: true,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: GetBuilder<HomeController>(
                builder: (controller) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      controller.isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.separated(
                              separatorBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Divider(
                                  color: Colors.grey.shade300,
                                  height: 1.0,
                                ),
                              ),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.salelist!.length +1,
                              itemBuilder: (context, index) {
                                if (index == controller.salelist!.length) {
                                  print('dooooooooooooooooooo');
                                  // This is the last item, show the progress indicator
                                  return controller.salePagenate
                                      ? Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Center(
                                            child: CircularProgressIndicator(strokeWidth: 1,),
                                          ),
                                        )
                                      : Container();
                                } else {
                                  // This is a regular item
                                  final value = controller.salelist?[index];
                                  return Container(
                                    height: 60,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: '#',
                                                      style: poppinsRegular.copyWith(color: Colors.grey),
                                                    ),
                                                    TextSpan(
                                                      text: value!.voucherNo,
                                                      style: poppinsRegular.copyWith(color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                value.billwiseStatus!,
                                                style: poppinsRegular.copyWith(
                                                  color: value.billwiseStatus == "paid"
                                                      ? Colors.green
                                                      : value.billwiseStatus == "unpaid"
                                                          ? Colors.red
                                                          : Colors.blue,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                value!.customerName ?? "",
                                                style: poppinsMedium,
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  text: 'SAR. ',
                                                  style: poppinsRegular.copyWith(color: Colors.grey, fontSize: 11),
                                                  children: [
                                                    TextSpan(
                                                      text: value.grandTotal.toString(),
                                                      style: poppinsRegular.copyWith(color: Colors.grey, fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;

  SliverDelegate({required this.child});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 60 ||
        oldDelegate.minExtent != 60 ||
        child != oldDelegate.child;
  }
}
