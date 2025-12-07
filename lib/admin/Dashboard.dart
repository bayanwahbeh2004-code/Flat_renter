import 'package:baytech/Constants.dart';
import 'package:baytech/Models/Register_request.dart';
import 'package:baytech/admin/DeletWidget.dart';
import 'package:baytech/admin/RequestWidget.dart';
import 'package:baytech/components/costum_button.dart';
import 'package:baytech/components/costum_text_Field.dart';
import 'package:baytech/services/admin/add_balance.dart';
import 'package:baytech/services/admin/get_deletion_requests.dart';
import 'package:baytech/services/admin/get_register_requests.dart';
import 'package:baytech/services/logout.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Dashboard extends StatefulWidget {
  static String id = "Dashboard";
  Register? accout;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool showRegisterList = true;
  bool isLoading = false;
  List<Register> Register_Request = [], Deletion_Request = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.accout = ModalRoute.of(context)!.settings.arguments as Register;
      registList(context);
    });
  }

  Future<void> registList(BuildContext context) async {
    if (isLoading) return;

    setState(() {
      showRegisterList = true;
      isLoading = true;
    });

    try {
      List<dynamic> regist = await getRegisterRequests(
        context: context,
        token: widget.accout!.token!,
      );

      setState(() {
        Register_Request.clear();
        if (regist.isNotEmpty)
          for (var value in regist) {
            Register_Request.add(Register.fromjson(value));
          }
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to load requests: $e')));
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> deleteList(BuildContext context) async {
    if (isLoading) return;

    setState(() {
      showRegisterList = false;
      isLoading = true;
    });

    try {
      List<dynamic> delete = await getDeletionRequests(
        context: context,
        token: widget.accout!.token!,
      );
      setState(() {
        Deletion_Request.clear();
        if (delete.isNotEmpty)
          for (var value in delete) {
            Deletion_Request.add(Register.fromjson(value));
          }
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load deletion requests: $e')),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        children: [
          Container(
            width: width * 0.2,
            child: Column(
              children: [
                SizedBox(height: height * 0.15),
                Text(
                  "Admin dashboard",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: height * 0.03,
                  ),
                ),
                SizedBox(height: height * 0.05),
                Image.asset(Klogo),
                SizedBox(height: height * 0.04),
                CostumButton(
                  text: "Add balance",
                  onTap: () => showAddBalanceDialog(context),
                  textColor: Colors.black,
                  buttonColor: Color.fromARGB(255, 239, 205, 255),
                  height: 30,
                  width: 200,
                ),
                SizedBox(height: height * 0.05),
                CostumButton(
                  text: "log out",
                  onTap: () {
                    Logout(
                      context: context,
                      token: widget.accout!.token!,
                      account: widget.accout!,
                    );
                  },
                  textColor: Colors.black,
                  buttonColor: Color.fromARGB(255, 239, 205, 255),
                  height: 30,
                  width: 200,
                ),
              ],
            ),
          ),
          Expanded(
            child: ModalProgressHUD(
              color: KPurple,
              inAsyncCall: isLoading,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: height * 0.12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CostumButton(
                          text: 'Register Request',
                          textColor: Colors.black,
                          buttonColor: showRegisterList
                              ? KPurple
                              : Color.fromARGB(255, 239, 205, 255),
                          onTap: () => registList(context),
                          height: 30,
                          width: 200,
                        ),
                        CostumButton(
                          text: 'Deletion Request',
                          textColor: Colors.black,
                          buttonColor: !showRegisterList
                              ? KPurple
                              : Color.fromARGB(255, 239, 205, 255),
                          onTap: () => deleteList(context),
                          height: 30,
                          width: 200,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: width * 0.8,
                    height: height * 0.85,
                    child: showRegisterList
                        ? Register_Request.isEmpty
                              ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.list_alt,
                                        size: 100,
                                        color: Colors.grey[300],
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "No registration requests",
                                        style: TextStyle(
                                          fontSize: width * 0.02,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : ListView.builder(
                                  itemBuilder: (context, index) =>
                                      Requestwidget(
                                        request: Register_Request[index],
                                      ),
                                  itemCount: Register_Request.length,
                                )
                        : Deletion_Request.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.delete_outline,
                                  size: 100,
                                  color: Colors.grey[300],
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "No deletion requests",
                                  style: TextStyle(
                                    fontSize: width * 0.02,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemBuilder: (context, index) =>
                                Deletwidget(request: Deletion_Request[index]),
                            itemCount: Deletion_Request.length,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showAddBalanceDialog(BuildContext context) {
    String phoneNumber = '', balance = '';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add balance"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CostumTextFeild(
              hintText: "User phone number",
              onchanged: (value) => phoneNumber = value,
            ),
            const SizedBox(height: 12),
            CostumTextFeild(
              hintText: "Balance",
              onchanged: (value) => balance = value,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: KPurple)),
          ),
          ElevatedButton(
            onPressed: () {
              addBalance(
                context: context,
                phoneNumber: phoneNumber,
                balance: balance,
                token: widget.accout!.token!,
              );
            },
            child: const Text("Confirm", style: TextStyle(color: KPurple)),
          ),
        ],
      ),
    );
  }
}
