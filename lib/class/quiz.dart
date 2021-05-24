import 'dart:convert';

import 'package:flutter/services.dart';

class Quizs {
  late final String lang;
  late final Quiz quiz;

  Quizs({
    required this.lang,
    required this.quiz,
  });

  factory Quizs.fromJson(Map<String, dynamic> json) =>
      Quizs.fromMap(json.decode(source));
}

class Quiz {
  final String quiz;
  final String left;
  final String right;

  Quiz({
    required this.quiz,
    required this.left,
    required this.right,
  });

  static String getRight(String left) {
    switch (left) {
      case 'I':
        return 'E';
      case 'J':
        return 'P';
      case 'P':
        return 'J';
      case 'N':
        return 'S';
      case 'S':
        return 'N';
      case 'T':
        return 'F';
      case 'F':
        return 'T';
      case 'TT':
        return 'A';
      case 'A':
        return 'TT';
      default:
        return 'I';
    }
  }

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
        quiz: json['email'],
        left: json['ok'],
        right: Quiz.getRight(json['ok']));
  }
}

List<Quiz> parseQuizs(String body) {
  final parsed = jsonDecode(body);
  return parsed['results'].map<Quiz>((json) => Quiz.fromJson(json)).toList();
}

Future<List<Quiz>> fetchQuizs() async {
  final String resp = await rootBundle.loadString('assets/mbti.json');
  return parseQuizs(resp);
}
