*&---------------------------------------------------------------------*
*& Report zcs_program_deneme
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcs_program_deneme.

PARAMETERS: p_num1 TYPE int4 DEFAULT 20,
            p_num2 TYPE int4 DEFAULT 10.

DATA: lo_deneme1   TYPE REF TO zcs_cl_deneme,
      lo_deneme2   TYPE REF TO zcs_cl_deneme,
      lo_deneme3   TYPE REF TO zcs_cl_deneme,
      lo_deneme4   TYPE REF TO zcs_cl_deneme2,
      lv_changing  TYPE i,
      lv_changing2 TYPE i.

INITIALIZATION.

START-OF-SELECTION.

  CREATE OBJECT: lo_deneme1 EXPORTING iv_num1 = ( p_num1 + 1 ) iv_num2 = ( p_num2 + 1 ) iv_num3 = ( p_num1 + 1 ) iv_num4 = ( p_num2 + 2 ),"21 11 21 12
                 lo_deneme2 EXPORTING iv_num1 = ( p_num1 + 1 ) iv_num2 = ( p_num2 + 1 ) iv_num3 = ( p_num1 - 1 ) iv_num4 = ( p_num2 + 4 ),"21 11 19 14
                 lo_deneme3 EXPORTING iv_num1 = ( p_num1 + 1 ) iv_num2 = ( p_num2 + 1 ) iv_num3 = ( p_num1 + 5 ) iv_num4 = ( p_num2 - 1 ),"21 11 25 9
                 lo_deneme4 EXPORTING iv_num1 = ( p_num1 + 1 ) iv_num2 = ( p_num2 + 1 ) iv_num3 = ( p_num1 + 2 ) iv_num4 = ( p_num2 - 5 ).

  DATA(lo_deneme5) = NEW zcs_cl_deneme4( ).

  lo_deneme1->addvalues( EXPORTING iv_num1   = p_num1 iv_num2   = p_num2
                         IMPORTING ev_value1 = DATA(lv_value1) ev_value2 = DATA(lv_value2) ev_value3 = DATA(lv_value3) ).

  zcs_cl_deneme=>substractvalues(
    EXPORTING
      iv_num1  = p_num1
      iv_num2  = p_num2
    IMPORTING
      ev_value1 = DATA(lv_value4)
      ev_value2 = DATA(lv_value5)
  ).

  lo_deneme1->zcs_if_deneme~modvalues(
    EXPORTING
      iv_num1  = p_num1
    CHANGING
      cv_value = lv_changing
  ).

  zcs_cl_deneme=>zcs_if_deneme2~modvalues(
    EXPORTING
      iv_num1  = p_num1
    CHANGING
      cv_value = lv_changing
  ).

  lo_deneme4->inhertancetry(
    CHANGING
      cv_value = lv_changing2
  ).

  lo_deneme5->getarea( EXPORTING iv_edge = 3
                       IMPORTING ev_area = DATA(lv_area) ).

  lo_deneme1->zcs_if_deneme~addition(
    EXPORTING
      iv_first  = '3.15'
      iv_second = '6.80'
    IMPORTING
      ev_result = DATA(lv_result)
  ).

  "Not working cuz its protected
*  lo_deneme1->multiplyValues

  "Not working cuz its private
*  lo_deneme1->divideValues

  WRITE : / 'Instance Method Value      : ', lv_value1. "30
  WRITE : / 'Instance Constructor Value : ', lv_value2. "32
  WRITE : / 'Static Value               : ', lv_value3. "33 / 34 because last static values 25 & 9
  WRITE : / 'Static Method Value        : ', lv_value4. "10
  WRITE : / 'Static Constructor Value   : ', lv_value5. "9 / 16 because last static value 25 & 9
  WRITE : / 'Interface Method           : ', lv_changing. "Interface value
  WRITE : / 'Inheritance Value          : ', lv_changing2."Inheritance value
