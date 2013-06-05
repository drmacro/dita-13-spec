<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:   DITA Learning/Training Aggregations                -->
<!--            Topicref Constraint Module                         -->
<!--  VERSION:  1.3a                                               -->
<!--  DATE:     October 2012                                       -->
<!--                                                               -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Constrain %topicref elements for DITA             -->
<!--             Learning/Training aggregation specializations     -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             October 2012                                      -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2012.                    -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!--    2012.10.19 DRB: Original creation                          -->
<!--                                                               -->
<!--    2012-11-13 DRB: Constraint entity name modified. Content   -->
<!--               model modified as recommended by the OASIS      -->
<!--               DITA Learning and Training Content              -->
<!--               Specialization SC.                              -->
<!--                                                               -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an 
      appropriate system identifier: 
      PUBLIC
"-//OASIS//ELEMENTS DITA Learning Aggregations Topicref Constraint//EN"
		Delivered as file "LearningAggregationsTopicrefConstraints.mod"
																																	 -->
<!-- ============================================================= -->

<!ENTITY % learningAggregationsTopicref-c-topicref 
									"keydef | 
									 mapref | 
									 topicgroup"
>

<!ENTITY learningAggregationsTopicref-c-att   "(map learningAggregationsTopicref-c)">

<!ENTITY % topicref  "%learningAggregationsTopicref-c-topicref;" >


