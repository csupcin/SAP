*&---------------------------------------------------------------------*
*& Report zcs_abap_750
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcs_abap_750.

TYPES :BEGIN OF lty_data,
         werks  TYPE werks_d,
         arbpl  TYPE arbpl,
         toplam TYPE menge_d,
         meins  TYPE meins,
         islem  TYPE int8,
       END OF lty_data.

TYPES : ltt_data TYPE TABLE OF lty_data WITH EMPTY KEY.

DATA  : lo_alv      TYPE REF TO cl_salv_table,
        lo_salv_msg TYPE REF TO cx_salv_msg.

DATA(lt_data_f) = VALUE ltt_data( ( werks = '2013' arbpl = '07' toplam = '16'   meins = '' )
                                  ( werks = '2013' arbpl = '07' toplam = '32'   meins = '' )
                                  ( werks = '2015' arbpl = '09' toplam = '07'   meins = '' ) ).

DATA : lt_data_s TYPE ltt_data.

lt_data_s       = VALUE #( FOR GROUPS ls_group OF <lfs_first> IN lt_data_f GROUP BY ( werks = <lfs_first>-werks
                                                                                      arbpl = <lfs_first>-arbpl )
                ( VALUE #( arbpl  = ls_group-arbpl
                           werks  = ls_group-werks
                           toplam = REDUCE netwr( INIT val TYPE menge_d
                                                   FOR ls_first IN GROUP ls_group
                                                   NEXT val = val + ls_first-toplam ) ) ) ) .

DATA(lt_data_t) = VALUE ltt_data( FOR ls_data IN lt_data_s LET lv_meins = 'ST'
                                                               lv_number1 = 5
                                                               lv_number2 = 3 IN ( meins  = lv_meins
                                                                                   werks  = ls_data-werks
                                                                                   arbpl  = ls_data-arbpl
                                                                                   toplam = ls_data-toplam
                                                                                   islem  = lv_number1 * lv_number2  ) ).

TRY.
    CALL METHOD cl_salv_table=>factory
      IMPORTING
        r_salv_table = lo_alv
      CHANGING
        t_table      = lt_data_t.
  CATCH cx_salv_msg INTO lo_salv_msg.
    MESSAGE lo_salv_msg TYPE 'E'.
ENDTRY.

lo_alv->display(  ).
