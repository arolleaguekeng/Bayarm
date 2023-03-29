import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/screens/historique/historique_screen.dart';
import 'package:bayarm/screens/profiles/update_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/auth_services.dart';
import 'widgets/profile_menu.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({Key? key}) : super(key: key);

  @override
  State<ProfileContent> createState() => _ProfileContent();
}

class _ProfileContent extends State<ProfileContent> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var textBright = "Dark Mode";
    var iconBright;
    if (!isDark) {
      textBright = "Light Mode";
      iconBright = Icons.light_mode_outlined;
    } else {
      textBright = "Dark Mode";
      iconBright = Icons.dark_mode_outlined;
    }
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: const Icon(Icons.android, size: 20, color: Colors.black),
        title: Text("Profil",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.apply(color: Colors.black, fontWeightDelta: 5)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu_outlined),
          )
        ],
        elevation: 0,
      ),
      backgroundColor: white,
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Stack(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset("assets/images/png/Alpha.jpg")),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green,
                  ),
                  child: const Icon(Icons.camera_alt_outlined,
                      size: 20, color: Colors.white),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Text("DevPea Alpha",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.apply(color: Colors.black, fontWeightDelta: 5)),
          Text("+237 655053546",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.apply(color: Colors.black)),
          const Divider(),
          const SizedBox(height: 20),

          /***************** MENU ****************/
          ProfileMenuWidget(
              title: "Edit Profile",
              icon: Icons.person_2_outlined,
              onPress: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => UpdateProfileContent()));
              }),
          ProfileMenuWidget(
              title: "Address",
              icon: Icons.person_pin_circle_outlined,
              onPress: () {}),
          ProfileMenuWidget(
              title: "Notification",
              icon: Icons.notifications_outlined,
              onPress: () {}),
          ProfileMenuWidget(
              title: "Payment", icon: Icons.payment_outlined, onPress: () {}),
          ProfileMenuWidget(
              title: "Security", icon: Icons.security_outlined, onPress: () {}),
          ProfileMenuWidget(
              title: "Language",
              icon: Icons.language_outlined,
              endText: "English (US)",
              onPress: () {}),
          ProfileMenuWidget(
            title: textBright,
            icon: iconBright,
            onPress: () {},
            endIcon: false,
          ),
          ProfileMenuWidget(
              title: "Privacy Polyce",
              icon: Icons.lock_outline,
              onPress: () {}),
          ProfileMenuWidget(
              title: "Help Center",
              icon: Icons.help_center_outlined,
              onPress: () {}),
          ProfileMenuWidget(
            title: "Historique",
            icon: Icons.list_sharp,
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (__) {
                    return HistoriqueScreen();
                  },
                ),
              );
            },
          ),
          ProfileMenuWidget(
            title: "Logout",
            icon: Icons.logout_outlined,
            textColor: Colors.red,
            endIcon: false,
            onPress: () async {
              await AuthService.disconnect();
            },
          ),
        ]),
      )),
    );
  }
}
