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
          child: CustomNotificationAppBar(title: 'RSVP Invites',)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
            child: PendingRequests(height: MediaQuery.of(context).size.height,)),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(index: 4,),
    );
  }
}
