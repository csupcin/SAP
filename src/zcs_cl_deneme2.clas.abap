CLASS zcs_cl_deneme2 DEFINITION
  PUBLIC
  INHERITING FROM zcs_cl_deneme
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS: inhertancetry
      CHANGING
        !cv_value TYPE i.
  PROTECTED SECTION.
    METHODS:
      multiplyvalues REDEFINITION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcs_cl_deneme2 IMPLEMENTATION.


  METHOD inhertancetry.


    cv_value = mv_num5.

    multiplyvalues( EXPORTING iv_num1   = cv_value
                              iv_num2   = cv_value
                    IMPORTING ev_value1 = cv_value ). "called protected function

    addvalues( EXPORTING iv_num1   = 66
                         iv_num2   = 35
               IMPORTING ev_value1 = DATA(lv_val1)
                         ev_value2 = DATA(lv_val2)
                         ev_value3 = DATA(lv_val3) ). "called public function

    cv_value += lv_val1 + lv_val2 + lv_val3.


  ENDMETHOD.


  METHOD multiplyvalues.

    super->multiplyvalues(
      EXPORTING
        iv_num1   = iv_num1
        iv_num2   = iv_num2
      IMPORTING
        ev_value1 = ev_value1
    ).

    ev_value1 = iv_num1 * iv_num2 * 4.

*    zcs_cl_deneme=>squarevalues(
*      CHANGING
*        cv_num = ev_value1
*    ).
*
*    DATA(lo_deneme) = new zcs_cl_deneme(
*      iv_num1 = 1
*      iv_num2 = 2
*      iv_num3 = 3
*      iv_num4 = 4
*    ).
*
*    lo_deneme->dividevalues(
*      EXPORTING
*        iv_num1       = 1
*        iv_num2       = 2
**      RECEIVING
**        rv_value1     = 3
**      EXCEPTIONS
**        rx_zerodivide = 1
**        others        = 2
*    ).
*    IF SY-SUBRC <> 0.
**     MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
**       WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
*    ENDIF.

  ENDMETHOD.

ENDCLASS.
