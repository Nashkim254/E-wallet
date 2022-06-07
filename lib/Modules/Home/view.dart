part of 'package:next_millionnaire/imports.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final controller = Get.put(HomeViewController());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: cardLightColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding:
                  const EdgeInsets.only(top: 48, left: 14, right: 14),
              minVerticalPadding: 0,
              leading: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    border: Border.all(color: primaryColor),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Icon(
                    Icons.person,
                    color: greyColor,
                  ),
                ),
              ),
              title: Text(
                "${controller.greeting(context)} Nashon,",
                style: theme.textTheme.bodyText1!.copyWith(
                    color: blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                "Nashon's account,",
                style: theme.textTheme.bodyText1!.copyWith(
                    color: blackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              trailing: InkWell(
                  onTap: (() => Get.to(const ProfileView())),
                  child: Image.asset("assets/images/profile.png")),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 20, right: 20),
              child: Container(
                height: 243,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.account_balance,
                        color: cardLightColor,
                      ),
                      title: Text(
                        "Overall Balance:",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: cardLightColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      trailing: Text(
                        "Ksh. 4,000",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: cardLightColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.money,
                        color: cardLightColor,
                      ),
                      title: Text(
                        "Deposit to:",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: cardLightColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      trailing: Text(
                        "0190230003981 ",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: cardLightColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.payments,
                        color: cardLightColor,
                      ),
                      title: Text(
                        "Paybill:",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: cardLightColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      trailing: Text(
                        "862862",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: cardLightColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.attach_money,
                        color: cardLightColor,
                      ),
                      title: Text(
                        "My balance:",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: cardLightColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      trailing: Text(
                        "1,000",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: cardLightColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomNameCard(name: "Nashon"),
                  CustomNameCard(name: "Peter"),
                  CustomNameCard(name: "Dennis"),
                  CustomNameCard(name: "Caleb"),
                  CustomNameCard(name: "Jacob"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20,top: 40),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: ListTile(
                  leading: Icon(Icons.inventory,color: cardLightColor,),
                  title: Text(
                    "Leading share holder:",
                    style: theme.textTheme.bodyText1!.copyWith(
                        color: cardLightColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text("Caleb",style: theme.textTheme.bodyText1!.copyWith(
                        color: cardLightColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),),
                  trailing: Text("Ksh. 1,000",style: theme.textTheme.bodyText1!.copyWith(
                        color: cardLightColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
