*  FINAL "no inheritance possible
CLASS zcs_cl_deneme DEFINITION
  PUBLIC
  CREATE PUBLIC
  GLOBAL FRIENDS zcs_cl_deneme2.

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  PUBLIC SECTION.

    INTERFACES zcs_if_deneme .
    INTERFACES zcs_if_deneme2 .

    "instance attribute
    DATA mv_num1 TYPE i .
    DATA mv_num2 TYPE i .
    "static attribute
    CLASS-DATA mv_num3 TYPE i .
    CLASS-DATA mv_num4 TYPE i .
    CLASS-DATA mv_clear TYPE i .

    "instance method
    METHODS constructor
      IMPORTING
        !iv_num1 TYPE i
        !iv_num2 TYPE i
        !iv_num3 TYPE i
        !iv_num4 TYPE i .
    METHODS addvalues
      IMPORTING                                               "pass by value
        VALUE(iv_num1) TYPE i OPTIONAL
        VALUE(iv_num2) TYPE i                                 "pass by value
      EXPORTING
        !ev_value1     TYPE i
        !ev_value2     TYPE i
        !ev_value3     TYPE i .
    "static method
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    CLASS-METHODS class_constructor .
    CLASS-METHODS substractvalues
      IMPORTING
        !iv_num1   TYPE i
        !iv_num2   TYPE i
      EXPORTING
        !ev_value1 TYPE i
        !ev_value2 TYPE i .
  PROTECTED SECTION.
    "instance attribute
    DATA: mv_num5 TYPE i.

    "static method
    CLASS-METHODS:
      clearValues CHANGING cv_num TYPE i.
    "instance method
    METHODS:
      multiplyValues IMPORTING iv_num1   TYPE i
                               iv_num2   TYPE i
                     EXPORTING ev_value1 TYPE i .
  PRIVATE SECTION.
    "static method
    CLASS-METHODS:
      squareValues CHANGING cv_num TYPE i.
    "instance method
    METHODS:
      divideValues IMPORTING  iv_num1          TYPE i
                              iv_num2          TYPE i
                   RETURNING  VALUE(rv_value1) TYPE i
                   EXCEPTIONS rx_zerodivide.

ENDCLASS.

CLASS zcs_cl_deneme IMPLEMENTATION.

  METHOD class_constructor.

    mv_clear = 0.

  ENDMETHOD.


  METHOD constructor.
    mv_num1 = iv_num1.
    mv_num2 = iv_num2.
    mv_num3 = iv_num3.
    mv_num4 = iv_num4.
    zcs_if_deneme~mv_mod = 5.
    zcs_if_deneme2~mv_mod = 4.
    mv_num5 = 11.
  ENDMETHOD.


  METHOD addValues.

*    iv_num1 += 1.

    ev_value1 = iv_num1 + iv_num2.
    ev_value2 = mv_num1 + mv_num2.
    ev_value3 = mv_num3 + mv_num4.


  ENDMETHOD.


  METHOD substractvalues.

    ev_value1 = iv_num1 - iv_num2.
    ev_value2 = mv_num3 - mv_num4.
*    rv_value = mv_num1 - mv_num2. "need to be static attribute

  ENDMETHOD.


  METHOD dividevalues.

    TRY.
        rv_value1 = iv_num1 / iv_num2.
      CATCH cx_sy_zerodivide.
        RAISE rx_zerodivide.
    ENDTRY.

  ENDMETHOD.


  METHOD multiplyvalues.

    ev_value1 = iv_num1 * iv_num2.

  ENDMETHOD.


  METHOD clearValues.

    cv_num = cv_num * mv_clear.

  ENDMETHOD.


  METHOD squareValues.

    cv_num = cv_num * cv_num.

  ENDMETHOD.


  METHOD zcs_if_deneme~modvalues.

    cv_value = iv_num1 MOD zcs_if_deneme~mv_mod.

  ENDMETHOD.

  METHOD zcs_if_deneme~addition.

    ev_result = iv_first + iv_second.

  ENDMETHOD.


  METHOD zcs_if_deneme2~modvalues.

    cv_value = iv_num1 MOD zcs_if_deneme2~mv_mod.

  ENDMETHOD.
ENDCLASS.
