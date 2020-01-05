import 'package:chimpu_edu_i/core/widgets/annoucnement_details.dart';
import 'package:chimpu_edu_i/core/widgets/network_image.dart';
/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
  */

import 'package:flutter/material.dart';

import '../../data/model/announcement.dart';
const TextStyle boldText = TextStyle(
  fontWeight: FontWeight.bold,
);
class AnnouncementListItem extends StatelessWidget {
  const AnnouncementListItem({
    Key key,
    @required this.announcement,
  }) : super(key: key);

  final Announcement announcement;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => AnnouncementDetails(
                    announcement: announcement,
                  ))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                if (announcement.image != null) ...[
                  Expanded(
                    child: PNetworkImage(
                      announcement.image,
                    ),
                  ),
                ],
                const SizedBox(height: 10.0),
                Text(
                  announcement.title,
                  style: boldText,
                ),
                const SizedBox(height: 10.0),
              ],
            ),
            Align(
                alignment: Alignment.topRight, child: Icon(Icons.open_in_new)),
          ],
        ),
      ),
    );
  }
}
