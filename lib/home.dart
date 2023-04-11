import 'package:flutter/material.dart';
import 'package:flutterproject/colors.dart';
import 'package:flutterproject/constants.dart';
import 'package:flutterproject/icons.dart';
import 'package:flutterproject/register.dart';
import 'menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Homescreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
     
      appBar: AppBar(
        backgroundColor:Colors.orange.shade400,
        automaticallyImplyLeading: false,
        title: 
          Row(
            children: [
              Text(appname,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold),),
            ],
          ),
      ),
       endDrawer: Row(
         children: [
           Menuscreen(),
         ],
       ),
      body:   
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Text(
                    "Ready for delivery",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.orange.shade500),
                  ),
                   SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    deliveryicon,
                    height: 25,
                    width: 25,
                  ),
                 
                ],
              ),
            ),
            InkWell(
              onTap: () {
                
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "My location",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: primarycolor,
                    size: 30,
                  ),
                ],
              ),
            ),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {},
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                searchicon,
                                height: 18,
                                width: 18,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "search food",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        filtericon,
                        height: 25,
                        width: 25,
                        color: primarycolor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Category",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),

                height: 115,

                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: listcards.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.orange.shade400,
                            ),
                            margin: EdgeInsets.only(
                                top: 5, bottom: 2, right: 5, left: 8),
                            child: Image.asset(listcards[index].imageurl),
                          ),
                          Text(
                            listcards[index].title,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Popular",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              for (int i = 0; i < imagecards.length; i++) ...{
                Container(
                  
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 5,
                            blurRadius: 5)
                      ]),

                  margin: EdgeInsets.only(top: 15,bottom: 15),
                  // child: ListView.builder(
                  // shrinkWrap: true,
                  // scrollDirection: Axis.vertical,
                  // itemCount: imagecards.length,
                  // itemBuilder: (context, index) {
                  // return
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // margin: EdgeInsets.only(top: 20),
                        height: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          image: DecorationImage(
                              image: AssetImage(imagecards[i].imageurl),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5, left: 5),
                        child: Text(
                          imagecards[i].title,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.deepOrange,
                              size: 28,
                            ),
                            Text(
                              imagecards[i].rating,
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 18),
                            ),
                            Text(
                              imagecards[i].ratingcount,
                              style: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 18),
                            ),
                            Spacer(),
                            Text(
                              imagecards[i].hotel,
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              imagecards[i].amount,
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                
                ),
              }
            ],
          ),
        ),
      ),
    );
  }
}

class categorymodel {
  String imageurl;
  String title;
  categorymodel(
    this.imageurl,
    this.title,
  );
}

List<categorymodel> listcards = [
  categorymodel("assets/demo/diet.png", "Diet"),
  categorymodel("assets/demo/pizza.png", "Pizza"),
  categorymodel("assets/demo/hamburger.png", "Burger"),
  categorymodel("assets/demo/roasted-chicken.png", "Grill"),
  categorymodel("assets/demo/diet.png", "Shawarma"),
  categorymodel("assets/demo/pizza.png", "Cake"),
];

class popularmodel {
  String imageurl;
  String title;
  String rating;
  String ratingcount;
  String hotel;
  String amount;
  popularmodel(this.imageurl,this.title,this.rating,this.ratingcount,this.hotel,this.amount);
}

List<popularmodel> imagecards = [
  popularmodel("assets/demo/bur.jpeg", "Burger delicious dish","4.5","(124 Ratings)","Indian"," Rs.280"),
  popularmodel("assets/demo/chik.jpeg", "Chicken biriyani spices","4.0","(150 Ratings)","Andhra"," Rs.350"),
  popularmodel("assets/demo/plate.jpeg", "Plate special items","3.8","(78 Ratings)","Chinese"," Rs.199"),
  popularmodel("assets/demo/deli.jpeg", "Chicken masala with burger","4.7","(266 Ratings)","Kerala"," Rs.220"),
];
