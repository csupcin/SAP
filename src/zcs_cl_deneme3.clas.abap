*  FINAL
class ZCS_CL_DENEME3 definition
  public
  abstract
  create public .

public section.

  methods GETCORNERS
  abstract                                           "interface
    exporting
      !EV_VALUE type I .
  methods GETAREA
    importing                                        "inheritance
      !IV_EDGE type DEC07
    exporting
      !EV_AREA type DEC07 .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCS_CL_DENEME3 IMPLEMENTATION.


  METHOD getarea.

    ev_area = iv_edge * iv_edge.

  ENDMETHOD.
ENDCLASS.
