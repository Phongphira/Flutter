import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/food_tile.dart';
import 'package:flutter_application_1/models/food.dart';
import 'package:flutter_application_1/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/pages/food_detials_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // Food menu
  List foodMenu = [
    Food(
      name: "nigiri sushi",
      price: "21.00",
      imagePath: "lib/images/nigiri.png",
      rating: "4.9",
    ),
    Food(
      name: "Tuna sushi",
      price: "23.00",
      imagePath: "lib/images/tuna_shushi.png",
      rating: "4.3",
    ),
  ];

  //navigate to food item details page
  void navigateToFoodDetials(int index){
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodMenu[index],
    ), ),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu, // Corrected the icon syntax
          color: Colors.grey[900],
        ),
        title: Text(
          'Tokyo',
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //promo banner
        Container(
          decoration: BoxDecoration(color: primartColor),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //promo message
                  Text(
                    'Get 32% Promo',
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  //redeem button
                  MyButton(
                    text: "Redeem",
                    onTap: () {},
                  ),
                ],
              ),

              //image
              Image.network(
                'https://cdn-icons-png.flaticon.com/128/2674/2674064.png',
                height: 100,
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        //search bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
              // border: OutlineInputBorder(
              // borderSide: BorderSide(color:Colors.white),
              // borderRadius: BorderRadius.circular(20),
              // ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),hintText: "Search here..",
            ),
          ),
        ),

        const SizedBox(height: 25),

        //menu list
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "Food Menu",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
              fontSize: 18,
            ),
          ),
        ),

        const SizedBox(height: 10),

        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foodMenu.length,
            itemBuilder: (context, index) => FoodTile(
              food: foodMenu[index],
              onTap: ()=> navigateToFoodDetials(index),
            ),
          ),
        ),

        const SizedBox(height: 25),

        //popular food
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Row(
              children: [
                //Image
                Image.asset(
                  "lib/images/salmonegg.png",
                  height: 60,
                ),
                const SizedBox(width: 20),
                //name and price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //name
                    Text(
                      "Salmon Eggs",
                      style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    //price
                    Text(
                      '\$21.00',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ],
            ),
            //heart
            const Icon(
              Icons.favorite_outline,
              color: Colors.grey,
              size: 28,
            ),
          ]),
        )
      ]),
    );
  }
}
