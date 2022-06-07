part of '../helpers.dart';

class CustomNameCard extends StatelessWidget {
  CustomNameCard({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: greenColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              Icons.account_balance,
              color: cardLightColor,
            ),
          ),
        ),
        Text(name)
      ],
    );
  }
}
