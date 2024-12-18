import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:janta_bike/page/Seller.dart';
import 'package:janta_bike/ui/color.dart';




class MyHomePage extends StatelessWidget {
  final List<String> bannerImages = [
    'assets/logo/download.jpg',
    'assets/logo/download.jpg',
    'assets/logo/download.jpg',
    'assets/logo/download.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home",style: TextStyle(color: AppColor.white),),
          backgroundColor: AppColor.primary,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner Section
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: bannerImages.map((image) {
                  return GestureDetector(
                    onTap: () {
                      print("Banner clicked: $image");
                    },
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover,

                        ),
                        color: AppColor.primary
                      ),
                    ),
                  );
                }).toList(),
              ),
      
              SizedBox(height: 20),
      
              // Selling and Buying Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Selling Card
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Selling()));
                        },
                        child: Card(
                          elevation: 4,
                          shadowColor:AppColor.primary ,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: AppColor.primary
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Image.asset('assets/logo/sell.png'),
                                SizedBox(height: 10),
                                Text(
                                  "Sell Now",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "List your products for sale.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
      
                    SizedBox(width: 10),
      
                    // Buying Card
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          print("Buy Now clicked");
                        },
                        child: Card(
                          elevation: 4,
                          shadowColor: AppColor.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: AppColor.primary
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Image.asset('assets/logo/buying.png'),
                                SizedBox(height: 10),
                                Text(
                                  "Buy Now",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Find great deals to buy.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      
              SizedBox(height: 20),
      
              // Random Posts Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Ower's Choice",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      
              SizedBox(height: 10),
      
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: 6, // Replace with dynamic count if fetching from API
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
      
                              image: DecorationImage(
                                image: AssetImage('assets/logo/car1.png'), // Placeholder image
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Thar $index",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Brief description goes here.",
                            style: TextStyle(color: Colors.grey),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
