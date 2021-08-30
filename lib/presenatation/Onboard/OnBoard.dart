import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mskola/constraints/Color.dart';
import 'package:mskola/presenatation/Onboard/getStarted.dart';
import 'package:mskola/presenatation/login/login.dart';




class OnBoard extends StatefulWidget {

  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentPage = 0;
  PageController _pageController = new PageController(
    initialPage: 0,
    keepPage: true,

  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    children: [
                      onBoardPage("kids_studying", "No more limitations! ", "mSkola is here to help you achieve the academic excellence you have always desired."),
                      onBoardPage("kid_studying_bro","Perform Better with our AI", "Our AI is designed to monitor your activities on the platform and make recommendations."),
                      onBoardPage("children_backpack","Prepare for an exam", "Are you writing an exam soon? mSkola helps to prepare you for any exam. Helping you achieve excellence is our top priority")
                    ],
                    onPageChanged: (value)=>{setCurrentPage(value)},

                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) => getIndicator(index)),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left:20.0,right: 20,bottom: 50.0,),
                      child:   Container(
                        child: MaterialButton(
                            // minWidth: double.infinity,
                            height: 60.0,
                            color: secondaryColor,
                            elevation: 0,
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                  GetStarted()), (Route<dynamic> route) => false);
                            }),
                      ),

                    ),
                  ],
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }

  Column onBoardPage(String image,String heading, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30,),
        Expanded(
          child:
          Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            "assets/images/$image.png",
            // fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height/2,
          ),
          // decoration: BoxDecoration(
          //
          //   borderRadius: BorderRadius.only(
          //       bottomLeft: Radius.circular(40.0),
          //       bottomRight: Radius.circular(40.0)),
          //
          // ),
        ),),
        SizedBox(
          height: 30,
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Text(heading, style:TextStyle(
              fontSize:24,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),),

          ),
        ),
        // SizedBox(height: 20,),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top:20.0, left: 10, right: 10),
            child: Container(
              child: Text(title, style:TextStyle(
                fontSize:18,color: primaryColor,
              ),),

            ),
          ),
        ),

      ],
    );

  }

  setCurrentPage(int value){
    currentPage = value;
    setState(() {

    });
  }

  AnimatedContainer getIndicator(int pageNo) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: 10,
      width: (currentPage == pageNo) ? 20 :10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: (currentPage== pageNo) ? primaryColor: Colors.grey
      ),
    );
  }
}
