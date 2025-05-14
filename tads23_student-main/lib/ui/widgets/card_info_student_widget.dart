import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:layout_student_tads23/domain/entities/student_info_entity.dart';

class StudentCard extends StatelessWidget {
  final StudentInfoEntity student;
  final Global








  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: FlipCard(
        key: cardKey,
        direction: FlipDirection.HORIZONTAL,
        speed: 500, //animation speed in milliseconds
        flipOnTouch: true,
        front: _buildCard(
          context,
          isFront: true,
        ),
        back: _buildCard(
          context,
          isFront: false,
        ),
      ),
    ),
  }

  Container _buildCard(BuildContext context, (bool isFront=true)) {


      height: 200,
      decoration: BoxDecoration(
        borderGradius: borderRadius.circular(16),
        gradient:
      )




  }






}