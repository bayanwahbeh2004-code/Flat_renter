import 'package:baytech/Constants.dart';
import 'package:flutter/material.dart';

class ProfileInforma extends StatelessWidget {
  static String id = "prof_page";

  final VoidCallback? onEditTap;
  final String userName;
  final String profileImage;

  const ProfileInforma({
    super.key,
    this.userName = "bayan",
    this.profileImage = "assets/images/profile.png",
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        children: <Widget>[
          _ProfileHeader(userName, profileImage, onEditTap ?? () {}),

          const SizedBox(height: 20),

          _buildMenuItem(
            icon: Icons.person_outline,
            title: "Profile",
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.light_mode_outlined,
            title: "App Theme",
            onTap: () {},
          ),
          _buildMenuItem(icon: Icons.language, title: "Language", onTap: () {}),
          _buildMenuItem(
            icon: Icons.payments_outlined,
            title: "Payment",
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.support_agent_outlined,
            title: "Support",
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.info_outline,
            title: "about us",
            onTap: () {},
          ),

          const Divider(height: 30, thickness: 1),

          _buildActionTile(icon: Icons.logout, title: "Log out", onTap: () {}),
          _buildActionTile(
            icon: Icons.delete_outline,
            title: "Delete account",
            onTap: () {},
          ),
        ],
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
              backgroundImage: AssetImage(imageUrl),
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
