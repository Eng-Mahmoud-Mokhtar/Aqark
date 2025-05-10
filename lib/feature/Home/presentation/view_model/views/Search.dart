import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> recentSearches = [];
  final List<String> popularSearches = [
    'Badya',
    'ZED',
    'June',
    'Salt',
    'Cairo Gate',
    'Mivida',
    'Solary',
    'El Sherouk',
    'Al Maadi',
    'New Cairo',
    'October City',
    'Heliopolis',
    '5th Settlement',
    'Giza',
    'Nasr City',
    'Zamalek'
  ];

  final TextEditingController searchController = TextEditingController();
  bool showAllPopular = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    searchController.dispose();
    super.dispose();
  }

  void onSearch() {
    String text = searchController.text.trim();
    if (text.isNotEmpty && !recentSearches.contains(text)) {
      setState(() {
        if (recentSearches.length >= 4) {
          recentSearches.removeLast();
        }
        recentSearches.insert(0, text);
      });
    }
    searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios,
                      color: Colors.black, size: screenWidth * 0.04),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    height: screenWidth * 0.12,
                    decoration: BoxDecoration(
                      color: const Color(0xffFAFAFA),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xffE9E9E9)),
                    ),
                    child: TextField(
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: searchController,
                      onSubmitted: (_) => onSearch(),
                      decoration: InputDecoration(
                        hintText: S.of(context).Search,
                        hintStyle: TextStyle(
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: screenWidth * 0.035,
                          horizontal: screenWidth * 0.02,
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.01),
                          child: Icon(
                            Icons.search_outlined,
                            color: Colors.grey,
                            size: screenWidth * 0.05,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            indicatorColor: KprimaryColor,
            labelColor: KprimaryColor,
            unselectedLabelColor: SubText,
            labelStyle: TextStyle(
              fontSize: screenWidth * 0.03,
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              Tab(text: S.of(context).all),
              Tab(text: S.of(context).Compounds),
              Tab(text: S.of(context).Developers),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            S.of(context).RecentSearches,
                            style: TextStyle(
                              color: const Color(0xff2F2F2F),
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          if (recentSearches.isEmpty)
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('Assets/file.png',
                                      width: screenWidth * 0.3,
                                      color: KprimaryColor.withOpacity(0.08)),
                                  SizedBox(height: screenHeight * 0.02),
                                  Text(
                                    S.of(context).NoRecentSearches,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.03,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          else
                            ...recentSearches.map((search) => GestureDetector(
                              onTap: () {
                                searchController.text = search;
                                onSearch();
                              },
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          search,
                                          style: TextStyle(
                                            color: Color(0xff2F2F2F),
                                            fontSize: screenWidth * 0.035,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textDirection:
                                          Directionality.of(context),
                                        ),
                                      ),
                                      Icon(
                                        Icons.outbond_outlined,
                                        size: screenWidth * 0.05,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  if (search != recentSearches.last)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Divider(
                                          color: Colors.grey.shade300,
                                          thickness: 1),
                                    ),
                                ],
                              ),
                            )).toList(),
                          SizedBox(height: 20.h),
                          Text(
                            S.of(context).PopularSearches,
                            style: TextStyle(
                              color: const Color(0xff2F2F2F),
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: [
                              ...popularSearches
                                  .take(showAllPopular
                                  ? popularSearches.length
                                  : 8)
                                  .map((search) => GestureDetector(
                                onTap: () {
                                  searchController.text = search;
                                  onSearch();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                    color:
                                    KprimaryColor.withOpacity(0.1),
                                    borderRadius:
                                    BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    search,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.03,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showAllPopular = !showAllPopular;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  decoration: BoxDecoration(
                                    color: showAllPopular
                                        ? KprimaryColor.withOpacity(0.1)
                                        : KprimaryColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    showAllPopular
                                        ? S.of(context).Less
                                        : S.of(context).More,
                                    style: TextStyle(
                                        color: showAllPopular
                                            ? SubText
                                            : Colors.white,
                                        fontSize: screenWidth * 0.03,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('Assets/file.png',
                            width: screenWidth * 0.3,
                            color: KprimaryColor.withOpacity(0.08)),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          S.of(context).NoResultstoShow,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('Assets/file.png',
                            width: screenWidth * 0.3,
                            color: KprimaryColor.withOpacity(0.08)),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          S.of(context).NoResultstoShow,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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
}