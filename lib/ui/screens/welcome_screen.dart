import 'package:flutter/material.dart';
import '../../../constant/strings.dart';
import '../../constant/assetImages.dart';
import '../../constant/routes.dart';
import '../../themes/colors.dart';




class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AssetImages.backgroundWelcomeGifPath,
            fit: BoxFit.fill,
            height: screenSize.height,
            width: screenSize.width,
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.only(
                left: 5,
                right: 5
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        Strings.tranSan,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white, fontSize: 40),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        Strings.slogan,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white, fontSize: 22),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10
                      ),
                      child:FractionallySizedBox(
                        heightFactor: 0.7,
                        alignment: Alignment.bottomCenter,
                        child:  ElevatedButton(
                            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                                backgroundColor: MaterialStateProperty.all<Color>(lightGreen.withOpacity(0.95))),
                            onPressed: (){
                              Navigator.pushNamed(context,Routes.loginScreen);
                            },
                            child: Center(
                              child: Text(
                                Strings.loginText,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontSize: 16),
                              ),
                            )
                        ),
                      )
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        padding: const EdgeInsets.only(
                            left: 10,
                            right: 10
                        ),
                        child:FractionallySizedBox(
                          heightFactor: 0.7,
                          alignment: Alignment.center,
                          child:  ElevatedButton(
                              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
                                  return RoundedRectangleBorder(
                                      side: const BorderSide(width: 1.0, color: Colors.white),
                                      borderRadius: BorderRadius.circular(20),
                                  );
                                }),
                              ),
                              onPressed: (){
                                Navigator.pushNamed(context,Routes.signUpScreen);
                              },
                              child: Center(
                                child: Text(
                                  Strings.signUpText,
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white,fontSize: 16),
                                ),
                              )
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}

