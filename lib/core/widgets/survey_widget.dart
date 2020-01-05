

import 'package:chimpu_edu_i/core/data/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../data/model/survey.dart';

class SurveyWidget extends StatelessWidget {
  final SurveyItem survey;

  const SurveyWidget({Key key, this.survey}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(survey.message,style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),),
              ...survey.options.map((option) =>RadioListTile(
                groupValue: null,
                value: survey.optionKeys[survey.options.indexOf(option)],
                title: Text(option),
                onChanged: (val){
                  FirestoreService().updateDocument('surveys', survey.id, {
                    val: FieldValue.increment(1),
                  });
                },
              ))
            ],
          ),
        )
      ),
    );
  }
}