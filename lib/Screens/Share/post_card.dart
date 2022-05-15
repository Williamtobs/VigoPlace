import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vigo_place/Constant/images.dart';

class NewsCard extends StatelessWidget {
  final String name;
  final String time;
  final String image;
  final String description;
  final String likes;
  final String postImage;
  final String comments;
  const NewsCard(
      {Key? key,
      required this.name,
      required this.time,
      required this.image,
      required this.description,
      required this.likes,
      required this.postImage,
      required this.comments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(image),
            ),
            title: Text(
              name,
              style: GoogleFonts.nunito(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(40, 42, 58, 1),
              ),
            ),
            subtitle: Text(
              time,
              style: GoogleFonts.nunito(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(142, 143, 153, 1),
              ),
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
              onPressed: () {},
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Divider(),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            description,
            style: GoogleFonts.nunito(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(74, 76, 90, 1),
            ),
          ),
        ),
        const SizedBox(height: 3),
        Image.asset(
          postImage,
          width: MediaQuery.of(context).size.width,
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              const Icon(Icons.favorite_border),
              const SizedBox(width: 3),
              // IconButton(
              //   icon: const Icon(Icons.favorite_border),
              //   onPressed: () {},
              // ),
              //const SizedBox(width: 5),
              Text(
                likes,
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(74, 76, 90, 1),
                ),
              ),
              const SizedBox(width: 5),
              Image.asset(chat),
              const SizedBox(width: 3),
              Text(
                comments,
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(74, 76, 90, 1),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 3),
        const Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Divider(),
        )
      ]),
    );
  }
}
