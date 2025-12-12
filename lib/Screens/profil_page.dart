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
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Kmdry),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Settings",
          style: TextStyle(color: Kmdry, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          children: <Widget>[
            _ProfileHeader(
              user!.firstName! + " " + user!.secondName!,
              KbaseUrlImage + user!.profilePicturePath!,
              widget.onEditTap ?? () {},
            ),

            const SizedBox(height: 20),

            _buildMenuItem(
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
                                style: TextStyle(fontSize: 16, color: KPurple),
                              ),
                              Text(
                                user!.firstName! + " " + user!.secondName!,
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(width: 40),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "phone number:",
                                style: TextStyle(fontSize: 16, color: KPurple),
                              ),
                              Text(
                                user!.phoneNumber!,
                                style: TextStyle(fontSize: 16),
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
                                    color: KPurple,
                                  ),
                                ),
                                Text(
                                  user!.birthday!,
                                  style: TextStyle(fontSize: 16),
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
                                style: TextStyle(fontSize: 16, color: KPurple),
                              ),
                              Text(
                                user!.id.toString()!,
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 30),
                      Text(
                        "ID card:",
                        style: TextStyle(color: KPurple, fontSize: 16),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
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
            _buildMenuItem(
              icon: Icons.light_mode_outlined,
              title: "App Theme",
              onTap: () {
                showDialoge(
                  context,
                  ok: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildMenuItem(
                        icon: Icons.sunny,
                        title: "light theme",
                        onTap: () {
                          Provider.of<ThemeProvider>(
                            context,
                            listen: false,
                          ).toggleTheme(lightmode);
                          Navigator.pop(context);
                        },
                      ),
                      _buildMenuItem(
                        icon: Icons.dark_mode,
                        title: "dark theme",
                        onTap: () {
                          Provider.of<ThemeProvider>(
                            context,
                            listen: false,
                          ).toggleTheme(darkmode);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            _buildMenuItem(
              icon: Icons.language,
              title: "Language",
              onTap: () {},
            ),
            _buildMenuItem(
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
                          Icon(Icons.attach_money_outlined, color: KPurple),
                          SizedBox(height: 50),
                          Text(
                            " Your balance:",
                            style: TextStyle(color: KPurple),
                          ),
                        ],
                      ),

                      Text(data.account ?? '0'),
                    ],
                  ),
                );
              },
            ),
            _buildMenuItem(
              icon: Icons.support_agent_outlined,
              title: "Support",
              onTap: () {},
            ),
            _buildMenuItem(
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
                          Text("bayan wehbeh"),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text("amina ainia"),
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
                              "assets/images/bayan wehbeh.png",
                            ),
                            radius: 50,
                          ),
                          SizedBox(width: 20),
                          Text("alaa helal"),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text("sarah sedekah"),
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
                              "assets/team/images/bayan_khere.png",
                            ),
                            radius: 50,
                          ),
                          SizedBox(width: 20),
                          Text("bayan al-kheder"),
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

  Widget _ProfileHeader(String name, String imageUrl, VoidCallback onEditTap) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(imageUrl),
              backgroundColor: Koption,
            ),
            GestureDetector(
              onTap: onEditTap,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5.0, right: 5.0),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Koption, width: 1),
                  ),
                  child: const Icon(
                    Icons.edit_outlined,
                    size: 18,
                    color: Kmdry,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Kmdry, size: 22),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Kmdry,
          fontWeight: FontWeight.normal,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
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
    Color textColor = Kmdry;

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
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Koption),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
    );
  }
}
