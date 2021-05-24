import 'dart:convert';

import 'package:http/http.dart' as http;

class Member {
  final String gender;
  final String name;
  final String email;
  final String phone;
  final String picture;

  Member(
      {required this.gender,
      required this.name,
      required this.email,
      required this.phone,
      required this.picture});

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
        email: json['email'],
        name:
            '${json['name']['title']} ${json['name']['last']}, ${json['name']['first']}',
        gender: json['gender'],
        phone: json['phone'],
        picture: json['picture']['large']);
  }
}

List<Member> parseMembers(String body) {
  final parsed = jsonDecode(body);
  print(body);
  return parsed['results']
      .map<Member>((json) => Member.fromJson(json))
      .toList();
}

Future<List<Member>> fetchMembers(
    {required http.Client client, int count = 1}) async {
  final resp = await client.get(Uri.parse(
      'https://randomuser.me/api/?results=$count&inc=gender,name,email,phone,picture'));
  return parseMembers(resp.body);
}
