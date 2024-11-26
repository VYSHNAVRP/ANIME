import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled8/Luck.dart';
import 'package:untitled8/repository/Model_class/Anime_Model.dart';

import 'bloc/anime_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Anime anime;

  @override
  void initState() {
    BlocProvider.of<AnimeBloc>(context).add(fetchAnime());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 30.h, left: 10.w),
          child: Row(
            children: [
              Icon(Icons.menu),
              SizedBox(width: 100.w),
              Text(
                "Filimku",
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 105.w,
              ),
              Icon(Icons.notifications),
            ],
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
          child: Row(
            children: [
              Text(
                "NOW SHOWING",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
              ),
              SizedBox(
                width: 100.w,
              ),
              Container(
                height: 20.h,
                width: 60.w,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(360.r),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "See more",
                    style:
                        TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          child: SizedBox(
            height: 270.h,
            child: BlocBuilder<AnimeBloc, AnimeState>(
              builder: (context, state) {
                if (state is Animeloading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is Animeerror) {
                  return RefreshIndicator(
                      child: Text(
                        "error",
                        style: TextStyle(color: Colors.red),
                      ),
                      onRefresh: () async {
                        return BlocProvider.of<AnimeBloc>(context)
                            .add(fetchAnime());
                      });
                }
                if (state is Animeloaded) {
                  anime = BlocProvider.of<AnimeBloc>(context).animeModel;

                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: anime.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => Luck(
                                      name: anime.data![index].title.toString(),
                                      types:
                                          anime.data![index].genres!.toList(),
                                      image:
                                          anime.data![index].image.toString(),
                                      Discription: anime.data![index].synopsis
                                          .toString(),
                                    )),
                          );
                        },
                        child: Container(
                          width: 152.w,
                          height: 275.h,
                          color: Colors.white,
                          child: Container(
                            child: Column(
                              children: [
                                Image.network(
                                  height: 190.h,
                                  width: 150.w,
                                  anime.data![index].image.toString(),
                                  fit: BoxFit.fill,
                                ),
                                Text(anime.data![index].title.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.sp,
                                    )),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 18.sp,
                                        color: Colors.yellow,
                                      ),
                                      Text("9.1/10 IMDB"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 5.w,
                      );
                    },
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
          child: Row(
            children: [
              Text(
                "POPULAR",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
              ),
              SizedBox(width: 140.h),
              Container(
                height: 20.h,
                width: 60.w,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(360.r),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "See more",
                    style:
                        TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
          height: 250.h,
          child: BlocBuilder<AnimeBloc, AnimeState>(
            builder: (context, state) {
              if (state is Animeloading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is Animeerror) {
                return RefreshIndicator(
                    child: Text("Error"),
                    onRefresh: () async {
                      return BlocProvider.of<AnimeBloc>(context)
                          .add(fetchAnime());
                    });
              }
              if (state is Animeloaded) {
                anime = BlocProvider.of<AnimeBloc>(context).animeModel;
                return ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: anime.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => Luck(
                                      name: anime.data![index].title.toString(),
                                      types:
                                          anime.data![index].genres!.toList(),
                                      image:
                                          anime.data![index].image.toString(),
                                      Discription: anime.data![index].synopsis
                                          .toString(),
                                    )),
                          );
                        },
                        child: Container(
                          height: 110.h,
                          width: 250.w,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Container(
                                width: 100.w,
                                height: 110.h,
                                color: Colors.red,
                                child: Image.network(
                                  anime.data![index].image.toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 10.w, top: 5.h),
                                    child: SizedBox(
                                      width: 200.w,
                                      child: Text(
                                        anime.data![index].title.toString(),
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 18.sp,
                                        color: Colors.yellow,
                                      ),
                                      Text("6.4/10 IMDB"),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: SizedBox(
                                      height: 20.h,
                                      width: 200.w,
                                      child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (BuildContext context,
                                              int position) {
                                            return Container(
                                              height: 20.h,
                                              width: 60.w,
                                              decoration: ShapeDecoration(
                                                  color: Colors.greenAccent,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.r))),
                                              child: Center(
                                                  child: Text(anime.data![index]
                                                      .genres![position]!
                                                      .toString())),
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return SizedBox(
                                              width: 10,
                                            );
                                          },
                                          itemCount: anime
                                              .data![index]!.genres!.length),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        size: 20.sp,
                                      ),
                                      Text("1h 47m"),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int position) {
                    return SizedBox(
                      height: 5,
                    );
                  },
                );
              } else {
                return SizedBox();
              }
            },
          ),
        )
      ]),
    );
  }
}
