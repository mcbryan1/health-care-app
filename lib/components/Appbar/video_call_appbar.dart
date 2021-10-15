import 'package:flutter/material.dart';
import 'package:gmeet/constants.dart';

class VideoCallAppbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onMuteVolumePressed;
  final VoidCallback reportPressed;
  const VideoCallAppbar({
    Key key,
    this.onBackPressed,
    this.onMuteVolumePressed,
    this.reportPressed,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Container(
          // padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onBackPressed,
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.arrow_back,
                    color: kTextDarkerColor,
                  ),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: onMuteVolumePressed,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: onMuteVolumePressed == null
                          ? Icon(
                              Icons.volume_mute_outlined,
                              color: kTextDarkerColor,
                            )
                          : Icon(
                              Icons.volume_up_outlined,
                              color: kTextDarkerColor,
                            ),
                    ),
                  ),
                  GestureDetector(
                    onTap: reportPressed,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.report_outlined,
                        color: kTextDarkerColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
