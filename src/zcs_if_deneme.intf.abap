INTERFACE zcs_if_deneme
  PUBLIC .

  DATA: mv_mod TYPE i.

  METHODS:
    modValues IMPORTING iv_num1  TYPE i
              CHANGING  cv_value TYPE i,
    addition  IMPORTING iv_first  TYPE decfloat
                        iv_second TYPE decfloat
              EXPORTING ev_result TYPE decfloat.

ENDINTERFACE.
