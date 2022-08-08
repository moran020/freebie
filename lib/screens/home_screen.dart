import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter/gestures.dart';
import '../data/colors.dart';
import 'details_page.dart';
import 'menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => ZoomDrawer(
        mainScreen: const Home(),
        menuScreen: const Menu(),
        borderRadius: 17.14,
        angle: 0,
        menuBackgroundColor: menuBackgroundColor,
      );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20.0, top: 24.0),
            child: Column(
              children: const [
                Location(),
                Search(),
                Category(),
                SeeMoreString(title: 'Near from you'),
                NearHousesList(),
                SeeMoreString(title: 'Best for you'),
                BestHousesList(),
              ],
            )),
      ),
    );
  }
}

// блок с выбором локации и кнопкой уведомлений
class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
            alignment: Alignment.topRight,
            child: Container(
                margin: const EdgeInsets.only(right: 20, top: 6),
                child: Image.asset(
                  'assets/icons/IC_Notification.png',
                ))),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Location',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8.0, right: 11),
                  child: const Text(
                    'Jakarta',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Image.asset(
                  'assets/icons/IC_Arrow down.png',
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}

// поисковая строка
class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24.0, right: 20),
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                style: const TextStyle(fontSize: 12),
                decoration: InputDecoration(
                    labelText: 'Search address, or near you',
                    filled: true,
                    fillColor: textFieldColor,
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: textFieldColor, width: 0.0),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    prefixIcon: Image.asset(
                      'assets/icons/IC_Search.png',
                    )),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {},
              child: Container(
                height: 48,
                width: 48,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        gradientBlueLight,
                        gradientBlueDark,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset(
                  'assets/icons/IC_Filter.png',
                ),
              ),
            ),
          ]),
    );
  }
}

// фильтры по видам недвижимости
class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      margin: const EdgeInsets.only(top: 20),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SelectedCard(title: 'House', textColor: textColorWhite),
          CategoryCard(
              title: 'Apartment',
              bgColor: textFieldColor,
              textColor: textColorGrey),
          CategoryCard(
              title: 'Hotel',
              bgColor: textFieldColor,
              textColor: textColorGrey),
          CategoryCard(
              title: 'Villa',
              bgColor: textFieldColor,
              textColor: textColorGrey),
          CategoryCard(
              title: 'Cottage',
              bgColor: textFieldColor,
              textColor: textColorGrey),
        ],
      ),
    );
  }
}

// кнопка фильтра по видам (выбранная)
class SelectedCard extends StatelessWidget {
  final String title;
  final dynamic textColor;

  const SelectedCard({
    Key? key,
    required this.title,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: TextButton(
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  gradientBlueLight,
                  gradientBlueDark,
                ],
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            title,
            style: TextStyle(fontSize: 12, color: textColor),
          ),
        ),
      ),
    );
  }
}

// кнопка фильтра по видам (неактивная)
class CategoryCard extends StatelessWidget {
  final String title;
  final dynamic bgColor;
  final dynamic textColor;

  const CategoryCard({
    Key? key,
    required this.title,
    required this.bgColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: TextButton(
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
              color: bgColor, borderRadius: BorderRadius.circular(10)),
          child: Text(
            title,
            style: TextStyle(fontSize: 12, color: textColor),
          ),
        ),
      ),
    );
  }
}

// заголовок и ссылка "узнать больше"
class SeeMoreString extends StatelessWidget {
  const SeeMoreString({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20.0, top: 32.0, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          RichText(
            text: TextSpan(
              text: 'See more ',
              recognizer: TapGestureRecognizer()..onTap = () {},
              style: TextStyle(
                  fontFamily: 'Raleway', fontSize: 12, color: textColorGrey),
            ),
          ),
        ],
      ),
    );
  }
}

// список домов рядом
class NearHousesList extends StatelessWidget {
  const NearHousesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 272,
        child: ListView(scrollDirection: Axis.horizontal, children: const [
          NearHousesCard(
            image: 'assets/images/house1.png',
            title: 'Dreamsville House',
            subtitle: 'Jl. Sultan Iskandar Muda',
            distance: '1,8',
          ),
          NearHousesCard(
            image: 'assets/images/house2.png',
            title: 'Ascot House',
            subtitle: 'Jl. Cilandak Tengah',
            distance: '3',
          ),
        ]));
  }
}

// карточка отдельного дома поблизости
class NearHousesCard extends StatelessWidget {
  const NearHousesCard(
      {Key? key,
      required this.image,
      required this.distance,
      required this.subtitle,
      required this.title})
      : super(key: key);

  final String image;
  final String distance;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DetailsPage()),
          );
        },
        child: Container(
            height: 272,
            width: 222,
            margin: const EdgeInsets.only(right: 24),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  child: AspectRatio(
                    aspectRatio: 222 / 272,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            alignment: FractionalOffset.topCenter,
                            image: AssetImage(
                              image,
                            ),
                          )),
                    ),
                  ),
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: LinearGradient(
                      colors: [gradientLight, gradientDark],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      Image.asset('assets/icons/IC_Location.png'),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        '$distance km',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: distanceColor,
                  ),
                  margin: const EdgeInsets.only(right: 16, top: 20),
                  height: 24,
                  width: 73,
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(
                    left: 20,
                    top: 215,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                            fontSize: 12,
                            color: cardHouseTextColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}

// раздел с лучшими домами
class BestHousesList extends StatelessWidget {
  const BestHousesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        BestHouseCard(
            image: 'assets/images/house3.png',
            title: 'Orchad House',
            price: '2.500.000.000',
            bathrooms: '4',
            bedrooms: '6'),
        BestHouseCard(
            image: 'assets/images/house4.png',
            title: 'The Hollies House',
            price: '2.000.000.000',
            bathrooms: '5',
            bedrooms: '2'),
        BestHouseCard(
            image: 'assets/images/house5.png',
            title: 'Sea Breezes House',
            price: '900.000.000',
            bathrooms: '2',
            bedrooms: '2'),
      ],
    );
  }
}

// карточка отдельного лучшего домами
class BestHouseCard extends StatelessWidget {
  const BestHouseCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.price,
      required this.bedrooms,
      required this.bathrooms})
      : super(key: key);

  final String image;
  final String title;
  final String price;
  final String bedrooms;
  final String bathrooms;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 29),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              height: 70,
              width: 70,
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 8,
              ),
              Text('Rp. $price / Year',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: priceColor)),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Image.asset('assets/icons/IC_Bed.png'),
                  const SizedBox(
                    width: 12,
                  ),
                  Text('$bedrooms Bedroom',
                      style: const TextStyle(
                        fontSize: 12,
                      )),
                  const SizedBox(
                    width: 24,
                  ),
                  Image.asset('assets/icons/IC_Bath.png'),
                  const SizedBox(
                    width: 12,
                  ),
                  Text('$bathrooms Bathroom',
                      style: const TextStyle(
                        fontSize: 12,
                      )),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
