import 'package:baytech/Screens/add_appartment_page.dart';
import 'package:baytech/helper/build_grid.dart';
import 'package:baytech/providers/my_houses_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHouses extends StatefulWidget {
  @override
  State<MyHouses> createState() => _MyHousesState();
}

class _MyHousesState extends State<MyHouses> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<MyHousesProvider>();
      provider.setMyHouses(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyHousesProvider>(
      builder: (context, MyHousesProvider, child) => Container(
        height: 600,
        child: Stack(
          children: [
            MyHousesProvider.MyHouses.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Icon(
                          Icons.home_work_outlined,
                          size: 64,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'No houses found',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: buildGrid(MyHousesProvider.MyHouses, true),
                  ),

            Positioned(
              bottom: 40,
              right: 50,
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                child: Icon(Icons.add),
                onPressed: () {
                  Navigator.pushNamed(context, AddAppartmentPage.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
