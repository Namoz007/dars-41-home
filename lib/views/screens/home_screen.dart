import 'package:dars_41_home/models/clothes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ScrollController();
  bool isScrool = true;
  
  void initState(){
    super.initState();
    controller.addListener(() {
      if (controller.offset >= 1960) {
        setState(() {
          isScrool = false;
        });
      } else {
        isScrool = true;
      }
    });
  }
  
  Clothes clothes = Clothes(imgUrl: 'https://i.pinimg.com/736x/b7/21/de/b721de95dc695e5e08ed562c70dbf055.jpg', price: 50, name: 'Short');
  Clothes clothes2 = Clothes(imgUrl: 'https://i.pinimg.com/originals/97/1d/d9/971dd9288f653f52c7c0336bd4cb28e8.jpg', price: 30, name: 'Shorttt');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: controller,
        slivers: [
          SliverAppBar(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
              ),
              child: InkWell(
                onTap: (){
                  print(controller);
                },
                child: Icon(Icons.arrow_back_ios),
              ),
            ),
            actions: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                ),
                child: Icon(Icons.more_vert),
              ),
            ],
            pinned: true,
            title: Text("Order Datails",style: TextStyle(color: Colors.red),),
            centerTitle: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network('https://i.pinimg.com/736x/b7/21/de/b721de95dc695e5e08ed562c70dbf055.jpg'),
            ),
            expandedHeight: 520,
          ),

          SliverPersistentHeader(
            pinned: isScrool,
            delegate: _SliverAppBarDelegate(
              minHeight: 20,
              maxHeight: 40,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text("Popular",style: TextStyle(color: Colors.blue,fontSize: 20),),
              )
            ),
          ),

          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      image: DecorationImage(
                        image: NetworkImage("${clothes.imgUrl}")
                      )
                    ),
                    alignment: Alignment.topCenter
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${clothes.price}\$",style: TextStyle(fontSize: 18,color: Colors.red),),

                      Icon(Icons.favorite_border)
                    ],
                  ),
                ],
              );
            }, childCount: 10),
          ),

          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
                minHeight: 20,
                maxHeight: 40,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Men's Fashion",style: TextStyle(color: Colors.blue,fontSize: 20),),
                )
            ),
          ),

          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: double.infinity,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 3),
            delegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  // color: Colors.red
                  image: DecorationImage(
                    image: NetworkImage('https://i.ytimg.com/vi/bjnQ_7cay4k/maxresdefault.jpg'),
                    fit: BoxFit.fitWidth
                  )
                // ),
              ));
            }, childCount: 10),
          ),
        ],
      ),
    );
  }
}


class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double minHeight;
  final Widget child;

  _SliverAppBarDelegate(
      {required this.maxHeight, required this.minHeight, required this.child});

  @override
  Widget build(Object context, double shrinkOffset, bool overLapsContent) {
    return child;
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
