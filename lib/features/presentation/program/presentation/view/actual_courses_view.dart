import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/helpers/widgets/custom_text.dart';
import 'package:grow_food/features/presentation/program/presentation/controller/actual_courses_cubit.dart';
import 'package:grow_food/features/presentation/program/presentation/controller/actual_courses_state.dart';
import 'package:grow_food/features/presentation/program/presentation/widget/curses_card.dart';

import '../widget/actual_curses_widget.dart';

class StudiesView extends StatefulWidget {
  const StudiesView({super.key});

  @override
  State<StudiesView> createState() => _StudiesViewState();
}

class _StudiesViewState extends State<StudiesView> {
  final actualCardController = StreamController<int>();
  BuildContext? tabContext;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    actualCardController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActualCoursesCubit, ActualCoursesState>(
      builder: (context, state) {
        if (state is ActualCoursesInitialState) {
          context.read<ActualCoursesCubit>().fetchCoursesVideo();
        } else if (state is ActualCoursesLoadedState) {
          return DefaultTabController(
            length: state.coursesVideoEntiti.directions.length,
            child: Builder(builder: (context) {
              tabContext = context;
              return Scaffold(
                backgroundColor: backgroundColor,
                body: NestedScrollView(
                  physics: const BouncingScrollPhysics(),
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        toolbarHeight: 83,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        flexibleSpace: SafeArea(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 60.h, left: 24.w),
                                child: CustomText(
                                  title: 'Акутальные курсы',
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverAppBar(
                        pinned: true,
                        elevation: 0,
                        backgroundColor: ColorsStyles.backgroundColor,
                        toolbarHeight: 7,
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(33.h),
                          child: StreamBuilder(
                            stream: actualCardController.stream,
                            initialData: 0,
                            builder: (context, snapshot) => TabBar(
                              onTap: (value) {
                                actualCardController.sink.add(value);
                              },
                              physics: const BouncingScrollPhysics(),
                              indicatorColor: Colors.transparent,
                              indicatorSize: TabBarIndicatorSize.label,
                              padding: EdgeInsets.only(
                                left: 12,
                                right: 12,
                                bottom: 5.h,
                              ),
                              labelPadding:
                                  EdgeInsets.symmetric(horizontal: 10.w),
                              isScrollable: true,
                              tabs: List.generate(
                                state.coursesVideoEntiti.directions.length,
                                (index) => ActualCursesCard(
                                  title: state.coursesVideoEntiti
                                      .directions[index].name,
                                  isSelected:
                                      snapshot.data == index ? true : false,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(
                      state.coursesVideoEntiti.directions.length,
                      (indexTabs) => ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.coursesVideoEntiti.videos.where(
                          (element) {
                            return element.course?.direction ==
                                state.coursesVideoEntiti.directions[indexTabs]
                                    .id;
                          },
                        ).length,
                        itemBuilder: (context, index) => CoursesCard(
                          videoEntiti: state.coursesVideoEntiti.videos
                              .where((element) =>
                                  element.course?.direction ==
                                  state.coursesVideoEntiti.directions[indexTabs]
                                      .id)
                              .toList()[index],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        }
        return const Text('Error');
      },
    );
  }
}
