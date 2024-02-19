import 'package:flare/screen/Home%20Layout/home%20Layout.dart';
import 'package:flare/shared/components/Text.dart';
import 'package:flare/shared/components/components.dart';
import 'package:flutter/material.dart';


class welcomePage extends StatelessWidget {
  final List<Map<String, String>> pages = [
    {
      'title': 'Page 1',
      'imagePath': 'images/welcome1Man.jpg',
      'description': 'Get ready to sweat and groove! Welcome to your ultimate fitness playground',
    },
    {
      'title': 'Page 2',
      'imagePath': 'images/welcome2Woman.jpeg',
      'description': 'Embrace the burn, celebrate progress, and thrive within the energy of our fitness empire!',
    },
    {
      'title': 'Page 3',
      'imagePath': 'images/welcome3Man.jpg',
      'description': 'Push your limits and strive for progress every day!',
    },
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return MyPage(
            title: pages[index]['title']!,
            imagePath: pages[index]['imagePath']!,
            description: pages[index]['description']!,
            index: index,

          );
        },
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;
  final int index ;

  const MyPage({super.key,
    required this.title,
    required this.imagePath,
    required this.description,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(imagePath),
          fit: BoxFit.cover,



        )
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 150,left: 20,
        right: 50),
        child: SizedBox(
          width: width*.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                  height:height*.6
              ),
              BuildText(
                text: description,
                color: Colors.white.withOpacity(.7),
                bold: true,
                letterSpacing: 1,
                maxLines: 5,
                size:20 ,
              ),
              SizedBox(
                height: height*.01,
              ),
              GestureDetector(
                onTap: (){
                 navigateToToFinish(context, const mainLayout());
                },
                child: Container(
                  height: height*.05,
                  width: width*.3,
                  decoration: BoxDecoration(
                    color: const Color(0xffAEEDBF),
                    borderRadius: BorderRadius.circular(50),



                  ),
                  child: Center(child: BuildText(text: 'Start Journey',
                  color: Colors.black.withOpacity(.8),bold: true,)),
                ),
              )

            ],
          ),
        )
      ),


    );

  }
}
