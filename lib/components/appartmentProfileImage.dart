import 'package:baytech/Constants.dart';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/Screens/viewAppartment.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:baytech/services/houses/favourite/isFavourite.dart';
import 'package:baytech/services/houses/show_houses/get_images.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AppartmentProfileImage extends StatefulWidget {
  final Apartment house;
  double width, heigth;

  AppartmentProfileImage({
    super.key,
    required this.width,
    required this.heigth,
    required this.house,
  });

  @override
  State<AppartmentProfileImage> createState() => _AppartmentProfileImageState();
}

class _AppartmentProfileImageState extends State<AppartmentProfileImage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: GestureDetector(
        onTap: () async {
          setState(() {
            isLoading = true;
          });
          widget.house.images = await getImages(
            context: context,
            house: widget.house,
          );
          widget.house.isFavourite = await isfavourite(
            context: context,
            id: widget.house.id!,
          );
          setState(() {
            isLoading = false;
          });
          Navigator.pushNamed(
            context,
            ApartmentDetailsPage.id,
            arguments: widget.house,
          );
        },
        child: Container(
          width: widget.width,
          height: widget.heigth,

          child: Stack(
            children: [
              // Circular Image
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(18),
                child: Image.network(
                  KbaseUrlImage + widget.house.mainImage!,
                  fit: BoxFit.cover,
                  width: widget.width,
                  height: widget.heigth,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      widget.house.title ?? '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: widget.width * 0.08,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: widget.heigth * 0.04,
                        ),
                        Text(
                          '${widget.house.location!.governorate!}, ${widget.house.location!.city!}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: widget.width * 0.06,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
