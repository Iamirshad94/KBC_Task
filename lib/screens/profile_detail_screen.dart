import 'package:flutter/material.dart';
import 'package:kbc/utility/app_button.dart';
import 'package:kbc/utility/app_theme.dart';
import 'package:kbc/utility/contants.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen(
      {required this.name,
      required this.dob,
      required this.city,
      required this.country,
      required this.gender});

  final String name;
  final String dob;
  final String city;
  final String country;
  final String gender;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
              title: Text(
                AppConstants.instance.profileDetail,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      child: buildHeader(screenSize, context),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      child: shareBox(screenSize, context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: heading(AppConstants.instance.patientDetails, context),
                    ),
                    commonRow('Name', name, context),
                    const SizedBox(
                      height: 10,
                    ),
                    commonRow('DOB', dob, context),
                    const SizedBox(
                      height: 10,
                    ),
                    commonRow('City', city, context),
                    const SizedBox(
                      height: 10,
                    ),
                    commonRow('Country', country, context),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: heading(AppConstants.instance.sharedProfile, context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: sharedProfile(screenSize, context),
                    ),

                  ],
                ),
              ),
            )));
  }

  // this widget is a header of home screen
  Widget buildHeader(Size screenSize, BuildContext context) {
    return Container(
      height: screenSize.height * 0.14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppTheme.instance.colorLightBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: profilePicture(24),
              )),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(gender ?? '',
                  style: Theme.of(context).textTheme.headlineMedium),
            ],
          )
        ],
      ),
    );
  }

  // this widget is a shareBox container
  Widget shareBox(Size screenSize, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenSize.height * 0.05),
      child: Container(
          height: screenSize.height * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppTheme.instance.colorDarkBlue,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    AppConstants.instance.shareProfile,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: AppButton(onPressed: () {}, text: 'Share profile'))
              ],
            ),
          )),
    );
  }

  // reusable widget for using headings
  Widget heading(String heading, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          heading,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }

  // reusable widget for using profile picture circle widget
  Widget profilePicture(double radius) {
    return Center(
      child: CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(
          AppConstants.instance.profileUrl2,
          scale: 0.5,
        ),
      ),
    );
  }

  Widget commonRow(String heading, String val, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          heading,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          val,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }

  Widget sharedProfile(Size screenSize, BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Container(
            height: screenSize.height * 0.08,
            width: screenSize.height * 0.15,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppTheme.instance.colorLightBlue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppConstants.instance.date,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(AppConstants.instance.time,
                        style: Theme.of(context).textTheme.titleSmall),
                  ],
                )
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(AppConstants.instance.views,
                    style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.instance.colorLightGreen)),
              ],
            )
          ],
        ),
      ],
    );
  }
}
