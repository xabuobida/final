import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testbuild/Screen/DryFruit.dart';
import 'package:testbuild/Screen/Fruit.dart';
import 'package:testbuild/Screen/supportpage.dart';
import 'package:testbuild/Screen/vegatables.dart';
import 'package:testbuild/Screen/withbottom/myaccount.dart';
import 'package:testbuild/view/Signin/Signin.dart';
import 'package:testbuild/view/cart/shoppingcart.dart';
import 'package:testbuild/viewModel/Profile/cubit.dart';
import 'package:testbuild/viewModel/Profile/states.dart';
import 'package:testbuild/viewModel/details/cubit.dart';

import '../../Screen/About.dart';
import '../../Screen/Details.dart';
import '../Profile/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  List searchResult = [];

  void searchFromFirebase(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('search')
        .where('string_id_array', arrayContains: query)
        .get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  late TabController _tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {

 int selectedindex = 0;
    List<Widget> pages = [
      Home(),
      shoppingcart(),
      Profile(),
    ];

    return WillPopScope(
      onWillPop: () async => false,
      child: BlocProvider(
        create: (context) => ProfileCubit()..getdata(),
        child: Scaffold(
          appBar: AppBar(
            actions: [
              InkWell(
                  onTap: () {
                    // route to profile
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => shoppingcart()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Icon(Icons.shopping_bag_outlined),
                  ))
            ],
            elevation: 0.0,
          ),
          drawer: Drawer(
            child: Column(
              children: [
                Expanded(
                  child: BlocConsumer<ProfileCubit, ProfileStates>(
                    builder: (context, state) {
                      return context.read<ProfileCubit>().data0.isEmpty
                          ? Center(child: CircularProgressIndicator())
                          : ListView(
                              children: [
                                DrawerHeader(
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 50,
                                        backgroundImage: context
                                                .read<ProfileCubit>()
                                                .infolist
                                                .isEmpty
                                            ? NetworkImage(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCp_ByMCZW8m0s3KmAbIENDvR2Zc_HkBJyYw&usqp=CAU")
                                            : NetworkImage(
                                                "${context.read<ProfileCubit>().infolist.first.image}"),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${FirebaseAuth.instance.currentUser!.email}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    // route to profile
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Profile()));
                                  },
                                  leading: Icon(Icons.info),
                                  title: Text(
                                    "Profile",
                                    style: TextStyle(fontSize: 14),
                                  ).tr(),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 20,
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    // route to profile
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AboutUs()));
                                  },
                                  leading: Icon(Icons.info),
                                  title: Text(
                                    "About",
                                    style: TextStyle(fontSize: 14),
                                  ).tr(),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 20,
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    // route to profile
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Home()));
                                  },
                                  leading: Icon(Icons.home),
                                  title: Text(
                                    "Home",
                                    style: TextStyle(fontSize: 14),
                                  ).tr(),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 20,
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    // route to profile
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SupportPage()));
                                  },
                                  leading: Icon(Icons.settings),
                                  title: Text(
                                    "Support Page",
                                    style: TextStyle(fontSize: 14),
                                  ).tr(),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 20,
                                  ),
                                ),

                                


                                       ListTile(
                                  onTap: () {
                                    // route to profile
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SettingsScreen()));
                                  },
                                  leading: Icon(Icons.settings),
                                  title: Text(
                                    "Settings",
                                    style: TextStyle(fontSize: 14),
                                  ).tr(),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 20,
                                  ),
                                ),

                              ],
                            );
                    },
                    listener: (context, state) {},
                  ),
                ),
                ListTile(
                  onTap: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      //
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => SigInScreen()),
                        (route) => false,
                      );
                    }).catchError((e) {
                      //
                    });
                  },
                  leading: Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  title: Text(
                    'Log Out',
                    style: TextStyle(fontSize: 14),
                  ).tr(),
                )
              ],
            ),
          ),
          body: pages.elementAt(selectedindex) ==0 ? Home() : Stack(
            children: [
              Container(
                height: 50,
                color: Colors.green,
              ),
              Positioned.fill(
                  top: 20,
                  child: SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        onTap: () {
                          showSearch(
                              context: context, delegate: MySearchDelegate());
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        width: double.infinity,
                        height: 40,
                        child: Container(
                          color: Colors.white,
                          child: TabBar(
                              unselectedLabelColor: Colors.black,
                              labelColor: Colors.black,
                              controller: _tabController,
                              tabs: [
                                Tab(
                                  child:
                                      Container(child: Text('Vegetables').tr()),
                                ),
                                Tab(
                                  child: Container(child: Text('Fruits').tr()),
                                ),
                                Tab(
                                  child:
                                      Container(child: Text('Dry Fruits').tr()),
                                ),
                              ]),
                        ),
                      ),
                      Container(
                        color: Colors.red,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.78,
                        child: Container(
                          child: TabBarView(
                              controller: _tabController,
                              children: [
                                vegatablesScreen(),
                                FruitScreen(),
                                DryFruitScreen()
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.green,
            currentIndex: selectedindex,
            onTap: (value) {
              setState(() {
                selectedindex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  Icons.home,
                ),
              ),
              BottomNavigationBarItem(
                  label: 'Shopping cart',
                  icon: Icon(Icons.shopping_basket_outlined)),
             
              BottomNavigationBarItem(
                  label: 'My Account', icon: Icon(Icons.account_box_outlined)),
            ]),
        ),
      ),
    );
  }
}
//  ,
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class MySearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
        // Build the results UI based on the query
        // You can display the search results here
        );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder<QuerySnapshot>(
      future: _firestore
          .collection('allitem')
          .where('title', isLessThanOrEqualTo: query)
          .get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        // Process the search results
        final List<DocumentSnapshot> documents = snapshot.data!.docs;
        return ListView.builder(
          itemCount: documents.length,
          itemBuilder: (BuildContext context, int index) {
            final DocumentSnapshot document = documents[index];
            return ListTile(
              title: Text(document['title']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(
                      desc: document['desc'],
                      image: document['image'],
                      title: document['title'],
                      price: document['price'],
                      uid: FirebaseAuth.instance.currentUser!.uid,
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
































// class customSearchDelegate extends SearchDelegate {


//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//           onPressed: () {
//             query = '';
//           },
//           icon: Icon(Icons.clear))
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           close(context, null);
//         },
//         icon: Icon(Icons.arrow_back));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var brand in ) {
//       if (brand.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(brand);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text('${result}'),
//         );
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var brand in data3) {
//       if (brand.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(brand);
//       }
//     }

//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text('${result}'),
//         );
//       },
//     );
//   }
// }
