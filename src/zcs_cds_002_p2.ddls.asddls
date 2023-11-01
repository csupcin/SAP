@AbapCatalog.sqlViewName: 'ZCS_CDS_V002_P2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Deneme CDS 2 P2'
define view ZCS_CDS_002_P2 as select from ZCS_CDS_002_P1 as t1
{
    key t1.vbeln,
    sum(t1.conversion_netwr)                as toplam_net_deger,
    t1.name                                 as musteri_ad_soyad,
    count(*)                                as toplam_fatura_adet ,
    division(cast( sum(t1.conversion_netwr) as abap.curr( 10, 3 ) ), cast( count(*) as abap.int1 ), 3) as ortalama_miktar,
    substring(t1.fkdat, 1, 4)               as faturalama_yili,
    substring(t1.fkdat, 5, 2)               as faturalama_ayi,
    substring(t1.fkdat, 7, 2)               as faturalama_gunu,
    substring(t1.inco2_l,1,3)               as incoterm_yeri
    
}   group by t1.vbeln,
             t1.name, 
             t1.fkdat, 
             t1.inco2_l
