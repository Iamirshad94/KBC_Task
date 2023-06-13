import 'package:flutter/material.dart';
import 'package:kbc/models/user_model.dart';
import 'package:kbc/screens/profile_detail_screen.dart';
import 'package:kbc/utility/app_button.dart';
import 'package:kbc/utility/app_theme.dart';
import '../utility/contants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User user = User(
      name: 'Michael Simpson',
      dob: '02-10-1994',
      city: 'New York',
      country: 'USA',
      gender: 'Female');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 36.0,left: 16.0,right: 16.0),
          child: DefaultTabController(
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        buildHeader(screenSize),
                        upcomingConsultations(screenSize),
                        patientProfiles(screenSize),
                      ],
                    ),
                  ) ,
                  SliverAppBar(
                    pinned: true,
                    floating: false,
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(screenSize.width * 0.06),
                      child: Container(
                        height: screenSize.width * 0.16,
                        decoration: BoxDecoration(
                            color: AppTheme.instance.colorLightBlue,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TabBar(
                            unselectedLabelColor: Colors.black,
                            indicatorSize: TabBarIndicatorSize.label,
                            labelColor: AppTheme.instance.colorWhite,
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppTheme.instance.colorDarkBlue),
                            tabs: [
                              Tab(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(AppConstants.instance.lastEnquires),
                                ),
                              ),
                              Tab(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(AppConstants.instance.reports),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(children: [
                tabBarView(screenSize),
                tabBarView(screenSize),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  // this widget is a header of home screen
  Widget buildHeader(Size screenSize) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenSize.height * 0.05),
      child: Row(
        children: [
          Expanded(
              child: Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileDetailScreen(
                                    name: user.name ?? '',
                                    dob: user.dob ?? '',
                                    city: user.city ?? '',
                                    country: user.country ?? '',
                                    gender: user.gender ?? '',
                                  )),
                        );
                      },
                      child: profilePicture(30))),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppConstants.instance.welcomeText,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(user.name ?? '',
                      style: Theme.of(context).textTheme.headlineLarge),
                ],
              )
            ],
          )),
          const Icon(Icons.menu)
        ],
      ),
    );
  }

  // this widget is used to render upcoming consultations section
  Widget upcomingConsultations(Size screenSize) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenSize.height * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: screenSize.height * 0.015),
            child: heading(AppConstants.instance.upComingConsultations),
          ),
          SizedBox(
            height: screenSize.height * 0.25,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: screenSize.width * 0.45,
                        height: screenSize.height * 0.25,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: index != 0
                              ? AppTheme.instance.colorLightBlue
                              : AppTheme.instance.colorDarkBlue,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(28),
                          child: Card(
                            elevation: 0.0,
                            color: index != 0
                                ? AppTheme.instance.colorLightBlue
                                : AppTheme.instance.colorDarkBlue,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppTheme.instance.colorBlue,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: profilePicture(20),
                                          )),
                                      Column(
                                        children: [
                                          Text(
                                            AppConstants.instance.time,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: index == 0
                                                    ? Colors.white
                                                    : Colors.black),
                                          ),
                                          Text(
                                            AppConstants.instance.date,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: index == 0
                                                    ? Colors.white
                                                    : Colors.black),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    user.name ?? '',
                                    style: index == 0
                                        ? Theme.of(context).textTheme.titleLarge
                                        : const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            decoration: TextDecoration.none),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  AppButton(
                                    onPressed: () {},
                                    text: index == 0
                                        ? AppConstants.instance.joinTheCall
                                        : AppConstants.instance.waitForCall,
                                    index: index,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }

  // this widget is used to render patient profile section section
  Widget patientProfiles(Size screenSize) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenSize.height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heading(AppConstants.instance.patientProfiles),
          SizedBox(
            height: screenSize.height * 0.10,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return CircleAvatar(
                      radius: 26,
                      backgroundColor: AppTheme.instance.colorLightGreen,
                      child: Icon(
                        Icons.add,
                        color: AppTheme.instance.colorWhite,
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: profilePicture(26),
                  );
                }),
          )
        ],
      ),
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

  // this is tabbar section widget
  Widget tabBarView(Size screenSize) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: AppTheme.instance.colorLightGreen,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: screenSize.height * 0.1,
              child: Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: ColoredBox(
                  color: AppTheme.instance.colorWhite,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 6,
                      ),
                      profilePicture(25),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name ?? '',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            AppConstants.instance.designation ?? '',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  // reusable widget for using headings
  Widget heading(String heading) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          heading,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Icon(
          Icons.arrow_forward,
          color: AppTheme.instance.colorArrow,
        )
      ],
    );
  }
}
