import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:yacht_booking/model/yacht.dart';
import '../scopedModel/connectedModel.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePageBody extends StatefulWidget {
  final YachtModel yachtModel;
  const HomePageBody({Key? key,  required this.yachtModel}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var tabController = TabController(length: 3, vsync: this,animationDuration: const Duration(milliseconds: 700));

    return ScopedModelDescendant(
      builder: (context, child, YachtModel model) => Scaffold(
          body: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width - 100),
                width: 100,
                color: const Color(0xffF4F4FA),
              ),

              _body(tabController)
            ],
          )),
    );
  }

  Widget _body(TabController tabController) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 10, left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 10,
              ),
              Container(
                padding: const EdgeInsets.only(right: 35),
                child: const Icon(IconData(0xef0a, fontFamily: 'icofont')),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
            width: 2,
          ),
          const ListTile(
            contentPadding: EdgeInsets.only(left: 0),
            title: Text(
              'Yacht',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
            ),
            subtitle: Text(
              'Charters',
              style: TextStyle(fontSize: 25, fontFamily: 'OpenSans'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          Row(
            children: [
              RotatedBox(
                quarterTurns: 3,
                child: SizedBox(
                  width: 300,
                  child: TabBar(
                    isScrollable: false,
                    controller: tabController,
                    labelColor: Colors.black,
                    indicator: DotIndicator(
                      color: Colors.black,
                      distanceFromCenter: 16,
                    ),
                    labelStyle: const TextStyle(
                      fontSize: 15,
                    ),
                    unselectedLabelColor: Colors.grey,
                    physics: const BouncingScrollPhysics(),
                    tabs:   const[
                      Text('Motor', style: TextStyle(fontSize: 13)),
                      Text('Sailing', style: TextStyle(fontSize: 13)),
                      Text('Motor-Sailing', style: TextStyle(fontSize: 11)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: 180,
                      child: CarouselSlider(
                        options:  CarouselOptions(
                          height: 370.0,
                          reverse: false,
                          pageSnapping: false,
                          aspectRatio: 16 / 9,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          autoPlayInterval:const Duration(seconds: 2) ,
                          scrollDirection: Axis.horizontal,
                        ),
                        items: List.generate(widget.yachtModel.allYacht.length,((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return GestureDetector(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                  child:
                                  _slideBox(
                                      widget.yachtModel.allYacht[i],
                                      i
                                      ),),
                                onTap: ()
                                {
                                  Navigator.pushNamed(context, 'detail/${i+1}');
                                },
                              );
                            },
                          );
                        })).toList(),
                      )))
            ],
          ),
          const SizedBox(height: 30,),
          const Text(
            'Popular',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: [
                  _popularYacht(
                      'assets/image/yacht_side_2.png', 'Oceana Yacht', " 4.5",const Color(0xfffeab0c)),
                  _popularYacht(
                      'assets/image/yacht_side_1.png', 'Ardena Yacht', " 3.2",const Color(0xff7a7a7a)),
                  _popularYacht(
                      'assets/image/yacht_side_2.png', 'Oceana Yacht', " 4.5",Colors.yellow[200]),
                  _popularYacht(
                      'assets/image/yacht_side_4.png', 'Ardena Yacht', " 3.2",const Color(0xff7a7a7a)),

                ],
              )),
          // _popularYacht(
          //     'assets/image/yacht_side_2.png', 'Oceana Yacht', " 4,5"),
          // _popularYacht(
          //     'assets/image/yacht_side_1.jpg', 'Ardena Yacht', " 3,2"),
        ],
      ),
    );
  }



  Widget _slideBox(Yacht yacht,int index) {
    return Container(
      margin: const EdgeInsets.only(right: 5, top: 10, bottom: 20),
      padding: const EdgeInsets.only(top: 20, left: 0, bottom: 20),
      width: 240,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
            color: Color(0xffd1d1e1), blurRadius: 10, offset: Offset(0, 10))
      ], borderRadius: BorderRadius.circular(20), color: const Color(0xff1a5ddd)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children:  [
              Row(
                children:  [
                  const SizedBox(width: 15),
                  SvgPicture.asset('assets/image/instagram.svg',height: 25,width: 25,),
                  const Text(
                    '#yachting',
                    style: TextStyle(color: Color(0xff74a4f9)),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
              const SizedBox(
                width: 15
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            yacht.image,
            height: 100,
            width: 200,
            alignment: FractionalOffset.centerLeft,
            fit: BoxFit.cover,
          ),
          const Spacer(),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            title: Text(
              yacht.name,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            subtitle: const Text(
              'Yacht',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Row(
            children: [
              const Text('     \$',
                  style: TextStyle(color: Colors.white60, fontSize: 15)),
              Text(' ${yacht.price}',
                  style: const TextStyle(color: Colors.white, fontSize: 15)),
              const Text(' / Day',
                  style: TextStyle(color: Colors.white60, fontSize: 15)),
            ],
          ),
          const Spacer(),

        ],
      ),
    );
  }


  Widget _popularYacht(String img, String name, String rating,Color? color) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 0),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
      subtitle: Row(
        children: [
          const Icon(
            Icons.star,
            size: 14,
          ),
          Text(rating)
        ],
      ),
      leading: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: color),
        child: Image.asset(
          img,
          height: 70,
          width: 70,
          alignment: FractionalOffset.centerLeft,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}



