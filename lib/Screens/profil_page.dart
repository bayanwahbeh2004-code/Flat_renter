import 'dart:ffi';

import 'package:baytech/Constants.dart';
import 'package:baytech/Models/User.dart';
import 'package:baytech/Theme/theme.dart';
import 'package:baytech/Theme/theme_proider.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:baytech/services/logout.dart';
import 'package:baytech/services/users/delete_account_request.dart';
import 'package:baytech/services/users/get_user.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class ProfileInforma extends StatefulWidget {
  static String id = "prof_page";
  final VoidCallback? onEditTap;

  ProfileInforma({this.onEditTap});

  @override
  State<ProfileInforma> createState() => _ProfileInformaState();
}

class _ProfileInformaState extends State<ProfileInforma> {
  User? user;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Settings",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          children: <Widget>[
            _ProfMen(
              user!.firstName! + " " + user!.secondName!,
              KbaseUrlImage + user!.profilePicturePath!,
            ),

            const SizedBox(height: 20),

            _buildMenit(
              icon: Icons.person_outline,
              title: "Profile",
              onTap: () {
                showDialoge(
                  context,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 40),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "User name:",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                ),
                              ),
                              Text(
                                user!.firstName! + " " + user!.secondName!,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 40),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "phone number:",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                ),
                              ),
                              Text(
                                user!.phoneNumber!,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Birth date:",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                  ),
                                ),
                                Text(
                                  user!.birthday!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 65),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "User id:",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                ),
                              ),
                              Text(
                                user!.id.toString()!,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 30),
                      Text(
                        "ID card:",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(8),
                        child: Image.network(
                          KbaseUrlImage + user!.indentityCardPath!,
                          width: 600,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            _buildMenit(
              icon: Icons.light_mode_outlined,
              title: "App Theme",
              onTap: () {
                showDialoge(
                  context,
                  ok: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildMenit(
                        icon: Icons.sunny,
                        title: "light theme",
                        onTap: () {
                          Provider.of<ThemeProvider>(
                            context,
                            listen: false,
                          ).set(lightmode);
                          Navigator.pop(context);
                        },
                      ),
                      _buildMenit(
                        icon: Icons.dark_mode,
                        title: "dark theme",
                        onTap: () {
                          Provider.of<ThemeProvider>(
                            context,
                            listen: false,
                          ).set(darkmode);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            _buildMenit(icon: Icons.language, title: "Language", onTap: () {}),
            _buildMenit(
              icon: Icons.payments_outlined,
              title: "Payment",
              onTap: () async {
                User data = await getUser(context: context);
                showDialoge(
                  context,
                  ok: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.attach_money_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          SizedBox(height: 50),
                          Text(
                            " Your balance:",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),

                      Text(
                        data.account ?? '0',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            _buildMenit(
              icon: Icons.support_agent_outlined,
              title: "Support",
              onTap: () {},
            ),
            _buildMenit(
              icon: Icons.info_outline,
              title: "about us",
              onTap: () {
                showDialoge(
                  context,
                  ok: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 30),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/images/team/bayan wehbeh.png",
                            ),
                            radius: 50,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "bayan wehbeh",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "amina ainia",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          SizedBox(width: 20),
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/images/team/amina ainia.jpg",
                            ),
                            radius: 50,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/images/team/bayan wehbeh.png",
                            ),
                            radius: 50,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "alaa helal",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "sarah sedekah",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          SizedBox(width: 20),
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/images/team/sarah sedekah.jpg",
                            ),
                            radius: 50,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/images/team/bayan_kheder.png",
                            ),
                            radius: 50,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "bayan al-kheder",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),

            const Divider(height: 30, thickness: 1),

            _buildActionTile(
              icon: Icons.logout,
              title: "Log out",
              onTap: () async {
                setState(() {
                  isLoading = true;
                });
                Logout(context: context);
                setState(() {
                  isLoading = false;
                });
              },
            ),
            _buildActionTile(
              icon: Icons.delete_outline,
              title: "Delete account",
              onTap: () async {
                setState(() {
                  isLoading = true;
                });
                await deleteRequest(context: context);
                setState(() {
                  isLoading = false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _ProfMen(String name, String imageUrl) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(imageUrl),
              backgroundColor: Theme.of(context).colorScheme.onSurface,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildMenit({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.primary,
        size: 22,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.normal,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Theme.of(context).colorScheme.primary,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    Color textColor = Theme.of(context).colorScheme.primary;

    return ListTile(
      leading: Icon(icon, color: textColor, size: 22),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Theme.of(context).colorScheme.primary,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
    );
  }
}
