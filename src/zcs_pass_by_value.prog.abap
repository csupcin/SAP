*&---------------------------------------------------------------------*
*& Report zcs_pass_by_value
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcs_pass_by_value.

DATA gv_time TYPE i.

CLASS lcl_time_utility DEFINITION FINAL.

  PUBLIC SECTION.
    CLASS-METHODS display_time
      IMPORTING
        iv_value                TYPE i
        VALUE(iv_pass_by_value) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS lcl_time_utility IMPLEMENTATION.

  METHOD display_time.

    WRITE: / 'Value : ',iv_value."4
    WRITE: / 'Pass by value', iv_pass_by_value."4

    gv_time += 4.

    WRITE: / 'Value : ',iv_value."8
    WRITE: / 'Pass by value', iv_pass_by_value."4

    iv_pass_by_value += 10.

    WRITE: / 'Value : ',iv_value."8
    WRITE: / 'Pass by value', iv_pass_by_value."14

  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

  gv_time = 4.

  lcl_time_utility=>display_time(
    iv_value         = gv_time
    iv_pass_by_value = gv_time
  ).
