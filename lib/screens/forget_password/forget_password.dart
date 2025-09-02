import 'package:flutter/material.dart';
import 'package:movie_app/utils/app_images.dart';
import 'package:movie_app/utils/widgets/intro_button.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../../utils/widgets/login_text_field.dart';
import '../login/login_screen.dart';

class ForgetPassword extends StatelessWidget {
  static const String routeName = "/forget";
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;       //  430
    double screenHeight = MediaQuery.of(context).size.height;     //  932

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: IconButton(onPressed: (){
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        }, icon: Icon(Icons.arrow_back_rounded, size: 24, color: AppColors.yellow,)),
        title: Text("Forget Password",style: AppStyles.yellow14Regular,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          children: [
            Image.asset(AppImages.forgetPassword),
            SizedBox(height: screenHeight *0.02,),
            LoginTextField(hintText: "Email", prefixIcon: Icon(Icons.email, size: 30,)),
            SizedBox(height: screenHeight *0.03,),
            IntroButton(text: "Verify Email", onPressed: (){})
          ],
        ),
      ),
    );
  }
}
