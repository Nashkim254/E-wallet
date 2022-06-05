part of '../helpers.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {
      required this.label,
      required this.onPress,
      required this.buttoncolor,
      required this.height,
      Key? key,})
      : super(key: key);
 final Widget label;
 final VoidCallback onPress;
 final Color buttoncolor;
 final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.only(left:41.0,right: 41),
        child: Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            color: buttoncolor,
            borderRadius: const BorderRadius.all(Radius.circular(8))
          ),
          child: Center(
              child: label,
           
          ),
        ),
      ),
    );
  }
}
