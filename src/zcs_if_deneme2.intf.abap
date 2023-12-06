INTERFACE zcs_if_deneme2
  PUBLIC .

  CLASS-DATA: mv_mod TYPE i .

  CLASS-METHODS: modvalues IMPORTING iv_num1  TYPE i
                           CHANGING  cv_value TYPE i.

ENDINTERFACE.
