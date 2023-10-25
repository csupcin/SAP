@AbapCatalog.sqlViewName: 'ZCS_CDS_V001'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Deneme CDS'
define view ZCS_CDS_001 as select from ekko      as t1
                            inner join ekpo      as t2 on t1.ebeln = t2.ebeln
                            inner join mara      as t3 on t2.matnr = t3.matnr
                            left outer join lfa1 as t4 on t1.lifnr = t4.lifnr
                            left outer join makt as t5 on t3.matnr = t5.matnr
                                                      and t5.spras = $session.system_language 
{
    t1.ebeln,
    t2.ebelp,
    t2.werks,
    t2.lgort,
    t2.meins,
    t3.matnr,
    t5.maktx,
    t4.lifnr,
    t4.name1,
    concat_with_space( t4.stras, t4.mcod3, 1 ) as satici_adresi
}
