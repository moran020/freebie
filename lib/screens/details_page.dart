import 'package:flutter/material.dart';
import '../data/colors.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.only(
              right: 20.0,
              top: 20.0,
              left: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TitleImage(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Description(),
                SizedBox(
                  height: 24,
                ),
                Owner(),
                SizedBox(
                  height: 32,
                ),
                Text(
                  'Gallery',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 21,
                ),
                Gallery(),
                SizedBox(
                  height: 32,
                ),
                MapAndButton()
              ],
            )),
      ),
    ));
  }
}

class TitleImage extends StatelessWidget {
  const TitleImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 304,
      child: Stack(
        children: [
          // изобрежение с градиентом
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: const DecorationImage(
                  fit: BoxFit.fitWidth,
                  alignment: FractionalOffset.center,
                  image: AssetImage(
                    'assets/images/house1.png',
                  ),
                )),
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                colors: [gradientLight, gradientDark],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // кнопка возврата
          Container(
            margin: const EdgeInsets.only(left: 20, top: 20),
            width: 34,
            height: 34,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: topIconsBackgroundColor),
            child: TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Image.asset('assets/icons/IC_Back.png'),
            ),
          ),
          // кнопка "добавить в закладки"
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.only(right: 20, top: 20),
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: topIconsBackgroundColor),
              child: TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {},
                child: Image.asset('assets/icons/IC_Bookmark.png'),
              ),
            ),
          ),
          // блок с названием и иконками внизу изображения
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              top: 191,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // заголовок
                const Text(
                  'Dreamsville House',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                // подзаголовок
                Text(
                  'Jl. Sultan Iskandar Muda, Jakarta selatan',
                  style: TextStyle(
                    fontSize: 12,
                    color: cardHouseTextColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    // количество спален
                    Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                          color: bottomIconsBackgroundColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Image.asset('assets/icons/IC_Bed_white.png'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      '6 Bedroom',
                      style: TextStyle(color: iconsTextColor, fontSize: 12),
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                    // количество ванных комнат
                    Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                          color: bottomIconsBackgroundColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Image.asset('assets/icons/IC_Bathroom_white.png'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      '4 Bathroom',
                      style: TextStyle(color: iconsTextColor, fontSize: 12),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// описание дома
class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text:
            'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars... ',
        style: TextStyle(
            fontSize: 12, color: textColorGrey, fontFamily: 'Raleway'),
        children: <TextSpan>[
          TextSpan(
              text: 'Show More ',
              style: TextStyle(fontSize: 12, color: gradientBlueDark)),
        ],
      ),
    );
  }
}

// информация о владельце
class Owner extends StatelessWidget {
  const Owner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // фото и имя
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: ownerAvatarColor,
              child: Image.asset('assets/images/owner.png'),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Garry Allen',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Owner',
                  style: TextStyle(fontSize: 16, color: textColorGrey),
                ),
              ],
            ),
          ],
        ),
        // иконки способов связи
        Row(
          children: [
            Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                  color: phoneIconBackgroundColor,
                  borderRadius: BorderRadius.circular(5)),
              child: Image.asset('assets/icons/IC_Phone.png'),
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                  color: phoneIconBackgroundColor,
                  borderRadius: BorderRadius.circular(5)),
              child: Image.asset('assets/icons/IC_Message.png'),
            ),
          ],
        ),
      ],
    );
  }
}

class Gallery extends StatelessWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        GalleryImage(
          image: 'assets/images/house14.png',
        ),
        GalleryImage(
          image: 'assets/images/house12.png',
        ),
        GalleryImage(
          image: 'assets/images/house13.png',
        ),
        GalleryImage(image: 'assets/images/house11.png', inscription: '+5'),
      ],
    );
  }
}

// изображение галереи
class GalleryImage extends StatelessWidget {
  const GalleryImage({Key? key, required this.image, this.inscription})
      : super(key: key);

  final String image;
  final String? inscription;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 72,
        width: 72,
        // добавление надписи на последнее изображение в ряду
        child: inscription == null
            ? const Text('')
            : Center(
                child: Text(inscription!,
                    style: TextStyle(
                        fontSize: 20,
                        color: textColorWhite,
                        fontWeight: FontWeight.bold)),
              ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            // добавление затемнения, если есть надпись
            image: inscription == null
                ? DecorationImage(
                    fit: BoxFit.fitWidth,
                    alignment: FractionalOffset.center,
                    image: AssetImage(
                      image,
                    ))
                : DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3),
                      BlendMode.darken,
                    ),
                    fit: BoxFit.fitWidth,
                    alignment: FractionalOffset.center,
                    image: AssetImage(
                      image,
                    ))));
  }
}

// карта и кнопка аренды
class MapAndButton extends StatelessWidget {
  const MapAndButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    alignment: FractionalOffset.center,
                    image: AssetImage(
                      'assets/images/Map.png',
                    ),
                  )),
              foregroundDecoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                gradient: LinearGradient(
                  colors: [gradientTransparent, gradientWhite],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 82),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(fontSize: 12, color: textColorGrey),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Rp. 2.500.000.000 / Year',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            // кнопка аренды
            Container(
              margin: const EdgeInsets.only(top: 81, left: 233),
              height: 43,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [gradientBlueLight, gradientBlueDark],
                ),
              ),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(side: BorderSide.none),
                onPressed: () {},
                child: const Center(
                  child: Text(
                    'Rent Now',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
