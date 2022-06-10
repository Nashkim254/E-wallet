part of 'package:next_millionnaire/imports.dart';

/// Displayed as a profile image if the user doesn't have one.
const placeholderImage =
    'https://upload.wikimedia.org/wikipedia/commons/c/cd/Portrait_Placeholder_Square.png';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late User user;
  late TextEditingController controller;

  String? photoURL;

  bool showSaveButton = false;
  bool isLoading = false;

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser!;
    controller = TextEditingController(text: user.displayName);

    controller.addListener(_onNameChanged);

    FirebaseAuth.instance.userChanges().listen((event) {
      if (event != null && mounted) {
        setState(() {
          user = event;
        });
      }
    });

    log(user.toString());

    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(_onNameChanged);

    super.dispose();
  }

  void setIsLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void _onNameChanged() {
    setState(() {
      if (controller.text == user.displayName || controller.text.isEmpty) {
        showSaveButton = false;
      } else {
        showSaveButton = true;
      }
    });
  }

  /// Map User provider data into a list of Provider Ids.
  List get userProviders => user.providerData.map((e) => e.providerId).toList();

  Future updateDisplayName() async {
    await user.updateDisplayName(controller.text);

    setState(() {
      showSaveButton = false;
    });

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Name updated')));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        
        centerTitle: true,
        title: Text(
          "Profile",
          style: theme.textTheme.bodyText1!.copyWith(
              color: blackColor, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        maxRadius: 60,
                        backgroundImage: NetworkImage(
                          user.photoURL ?? placeholderImage,
                        ),
                      ),
                      Positioned.directional(
                        textDirection: Directionality.of(context),
                        end: 0,
                        bottom: 0,
                        child: Material(
                          clipBehavior: Clip.antiAlias,
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(40),
                          child: InkWell(
                            onTap: () async {
                              final photoURL = await getPhotoURLFromUser();

                              if (photoURL != null) {
                                await user.updatePhotoURL(photoURL);
                              }
                            },
                            radius: 50,
                            child: const SizedBox(
                              width: 35,
                              height: 35,
                              child: Icon(Icons.edit),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: controller,
                      style: TextStyle(color: blackColor),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        alignLabelWithHint: true,
                        label: Center(
                          child: Text(
                            'Click to add a display name',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Card(
                      child: ListTile(
                        tileColor: primaryColor,
                        leading: userProviders.contains('phone') ?
                        const Icon(Icons.phone): 
                         userProviders.contains('password') ?
                        Icon(
                          Icons.mail,
                          color: cardLightColor,
                        ) :userProviders.contains('google.com') ?
                         SizedBox(
                          width: 24,
                          child: Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/0/09/IOS_Google_icon.png',
                          ),
                        ) :const SizedBox(),
                        title: Text(
                          user.email ?? user.phoneNumber ?? 'User',
                          style: TextStyle(color: cardLightColor),
                        ),
                      ),
                    ),
                  ),
                
                  const SizedBox(height: 40),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor)),
                    onPressed: _signOut,
                    child: const Text('Sign out'),
                  ),
                ],
              ),
            ),
          ),
          Positioned.directional(
            textDirection: Directionality.of(context),
            end: 40,
            top: 40,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: !showSaveButton
                  ? SizedBox(key: UniqueKey())
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor)),
                      onPressed: isLoading ? null : updateDisplayName,
                      child: const Text('Save changes'),
                    ),
            ),
          )
        ],
      ),
    );
  }

  Future<String?> getPhotoURLFromUser() async {
    String? photoURL;

    // Update the UI - wait for the user to enter the SMS code
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('New image Url:'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Update'),
            ),
            OutlinedButton(
              onPressed: () {
                photoURL = null;
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
          content: Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              onChanged: (value) {
                photoURL = value;
              },
              textAlign: TextAlign.center,
              autofocus: true,
            ),
          ),
        );
      },
    );

    return photoURL;
  }

  /// Example code for sign out.
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => SigninView()));
  }
}
