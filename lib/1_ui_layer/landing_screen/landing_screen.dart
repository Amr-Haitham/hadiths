import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadiths/1_ui_layer/landing_screen/list_of_collections_screen/list_of_categories_screen.dart';
import 'package:hadiths/consts/assets_urls.dart';

import '../../2_bl_layer/category_cubit/category_cubit.dart';
import '../../consts/general_functions.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              right: 0, top: 0, child: Image.asset(quarterCircleTopRightImage)),
          Positioned(
              left: 0,
              bottom: 0,
              child: Image.asset(circlePartBottomLeftImage)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("الجامع",
                  style: GoogleFonts.arefRuqaa(
                    color: const Color.fromRGBO(108, 94, 88, 1),
                    fontWeight: FontWeight.w400,
                    fontSize: 72,
                  )),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/pics/black small circle.png"),
                      Text(
                        "الجامع للأحاديث",
                        style: amiriQuranFontTextStyle(
                            29, const Color.fromRGBO(229, 0, 18, 1)),
                      ),
                      Image.asset("assets/pics/black small circle.png")
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => CategoryCubit(),
                            child: const ListOfCategoriesScreen(),
                          ),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(144, 126, 119, 0.15),
                        shape: const StadiumBorder()),
                    child: Text(
                      "البدأ",
                      style: amiriQuranFontTextStyle(
                          15, const Color.fromRGBO(229, 0, 18, 1)),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
