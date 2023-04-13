import 'package:app_trang_suc/Screens/homepage/homepage.dart';
import 'package:app_trang_suc/components/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:app_trang_suc/constants.dart';

class RoundedButton extends StatelessWidget {
 
  const RoundedButton({
    Key? key,
    required this.title,
    this.onTap  
  }) : super(key: key);


  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.baseLightOrangeColor,//yPrimaryColor
        ),
        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 20 , fontWeight: FontWeight.w700),
        ),
        
      ),
      onTap: onTap,
    );
  }
}
