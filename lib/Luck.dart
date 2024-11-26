import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled8/bloc/anime_bloc.dart';
import 'package:untitled8/repository/Model_class/Anime_Model.dart';

class Luck extends StatefulWidget {
  final String name;
  final List<dynamic> types;
  final String image;
  final String Discription;

  const Luck({super.key, required this.name, required this.types,required this.image, required this.Discription});

  @override
  State<Luck> createState() => _LuckState();
}

class _LuckState extends State<Luck> {
  late Anime anime;

  @override
  void initState() {
    BlocProvider.of<AnimeBloc>(context).add(fetchAnime());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250.h,
              width: double.infinity.w,
              color: Colors.white,
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Row(
                children: [
                  SizedBox(height: 50.h,
                    width: 240.w,
        
                    child: Text(widget.name,
        
                      style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    width: 80.w,
                  ),
                  Icon(
                    Icons.bookmark_outline,
                    size: 28.sp,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 17.sp,
                    color: Colors.yellow,
                  ),
                  Text(
                    "9.1/10 IMDB",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              height: 20.h,
              width: 200.w,
              child: BlocBuilder<AnimeBloc, AnimeState>(
                builder: (context, state) {
                  if(state is Animeloading){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if(state is  Animeerror){
                    return RefreshIndicator(child: Text("error"), onRefresh:() async{
                      return BlocProvider.of<AnimeBloc>(context).add(fetchAnime());
                    });
                  }
                  if(state is Animeloaded){
                    anime = BlocProvider.of<AnimeBloc>(context).animeModel;
                    return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int position) {
                          return Container(
                            height: 20.h,
                            width: 60.w,
                            decoration: ShapeDecoration(
                                color: Colors.greenAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r))),
                            child: Text(widget.types[position].toString(),),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 10,
                          );
                        },
                        itemCount:widget.types.length)   ;
                  }
                  else{
                    return SizedBox();
                  }
                },
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  Text(
                    "Length",
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text("Langauge"),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text("Rating"),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  Text(
                    "2h 28m",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    "English",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 28.w,
                  ),
                  Text(
                    "PG-13",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                "DISCRIPTION",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                  widget.Discription
            ),),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: Row(
                children: [
                  Text(
                    "CAST",
                    style:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
                  ),
                  SizedBox(
                    width: 200.w,
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
                        style: TextStyle(
                            fontSize: 11.sp, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 7.w),
              child: Row(
                children: [
                  Container(
                    height: 85.h,
                    width: 85.w,
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r))),
                    child: Image.asset("assets/peter.png", fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 3.w,),
                  Container(
                    height: 85.h,
                    width: 85.w,
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r))),
                    child: Image.asset("assets/sucker.png", fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 3.w,),
                  Container(
                    height: 85.h,
                    width: 85.w,
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r))),
                    child: Image.asset("assets/doctor.png", fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 3.w,),
                  Container(
                    height: 85.h,
                    width: 85.w,
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r))),
                    child: Image.asset("assets/friend.png", fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 3.w,),
                ],
              ),
            ),
            SizedBox(height: 4.h,),
            Padding(
              padding: EdgeInsets.only(left: 5.w,),
              child: Row(
                children: [
                  Text("Tom Hollend"),
                  SizedBox(width: 25.w,),
                  Text("Zendaya"),
                  SizedBox(width: 35.w,),
                  Text("Bendit"),
                  SizedBox(width: 55.w,),
                  Text("Jacon"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
