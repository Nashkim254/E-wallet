part of 'package:next_millionnaire/imports.dart';

class Admin extends StatelessWidget {
  Admin({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(AdminController());
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users =
        FirebaseFirestore.instance.collection('transactions');
    Future<void> addTransaction() {
      // Call the user's CollectionReference to add a new user
      return users
          .doc("${_auth.currentUser!.displayName}")
          .set({
            'name': controller.name.text,
            'amount': controller.amount.text,
            "createdAt": DateTime.now().toString() // 42
          })
          .then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: greenColor,
              content: const Text("Transaction Added successfully"))))
          .catchError((error) => print("Failed to add user: $error"));
    }

    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: cardLightColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: cardLightColor,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: blackColor,
            )),
        title: Text(
          "Admin",
          style: theme.textTheme.bodyText1!
              .copyWith(color: blackColor, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 91.0, left: 41),
              child: Text(
                "Add transaction",
                style: theme.textTheme.bodyText1!.copyWith(
                    fontSize: 24,
                    color: blackColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(41, 12, 41, 5),
                    child: TextFormField(
                      controller: controller.name,
                      keyboardType: TextInputType.phone,
                      validator: (value) => controller.nameValidator(value!),
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        hintText: "Name",
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        hintStyle: const TextStyle(
                            fontSize: 14,
                            color: Colors.black45,
                            fontWeight: FontWeight.w500),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: formFieldColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(41, 12, 41, 5),
                    child: TextFormField(
                      controller: controller.amount,
                      keyboardType: TextInputType.phone,
                      validator: (value) => controller.amountValidator(value!),
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        hintText: "Amount",
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        hintStyle: const TextStyle(
                            fontSize: 14,
                            color: Colors.black45,
                            fontWeight: FontWeight.w500),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: formFieldColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 41, 0, 5),
                child: CustomButton(
                  buttoncolor: primaryColor,
                  height: 56,
                  label: Text(
                    "Add Transaction",
                    style: TextStyle(
                        fontSize: 14,
                        color: cardLightColor,
                        fontWeight: FontWeight.w500),
                  ),
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      try {
                        addTransaction();
                      } catch (e) {
                        printError(e);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("Please ensure all fields are valid")));
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}
