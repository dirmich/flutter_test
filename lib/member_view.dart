import 'package:flutter/material.dart';

import 'class/member.dart';

class MemberView extends StatelessWidget {
  const MemberView({
    Key? key,
    required this.futureMember,
  }) : super(key: key);

  final Future<List<Member>> futureMember;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.amberAccent),
      child: FutureBuilder<List<Member>>(
        future: futureMember,
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? MemberList(
                  members: snapshot.data!,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
      // child: FutureBuilder<Album>(
      //   future: futureAlbum,
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       return Text(snapshot.data!.title);
      //     } else if (snapshot.hasError) {
      //       return Text('${snapshot.error}');
      //     }
      //     return CircularProgressIndicator();
      //   },
      // ),
    );
  }
}

class MemberList extends StatelessWidget {
  final List<Member> members;
  const MemberList({
    Key? key,
    required this.members,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: members.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Stack(children: [
              Image.network(
                members[index].picture,
                fit: BoxFit.contain,
              ),
              Text(
                members[index].name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ]),
            Text(
              members[index].gender,
              overflow: TextOverflow.ellipsis,
            ),
            Text(members[index].phone, overflow: TextOverflow.ellipsis),
          ],
        );
      },
    );
  }
}
