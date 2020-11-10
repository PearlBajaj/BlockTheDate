import 'package:block_the_date/components/customAppBar.dart';
import 'package:block_the_date/components/customBottomNavigationBar.dart';
import 'package:block_the_date/components/pendingRequests.dart';
import 'package:flutter/material.dart';

class RSVPInvitesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(66.0),
          child: CustomNotificationAppBar(title: 'RSVP Invites', leading: false,)
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:16.0,right: 16),
        child: Container(
            child: PendingRequestsRSVP()),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(index: 4,),
    );
  }
}
