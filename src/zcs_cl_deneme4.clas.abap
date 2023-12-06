CLASS zcs_cl_deneme4 DEFINITION                    "get corners kapa hataları göster
  PUBLIC
  INHERITING FROM zcs_cl_deneme3
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: getcorners REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcs_cl_deneme4 IMPLEMENTATION.


  METHOD getcorners.
    ev_value = 3.
  ENDMETHOD.

ENDCLASS.
