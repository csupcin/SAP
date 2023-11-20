@AbapCatalog.sqlViewName: 'ZCS_CDS_V002_P1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Deneme CDS 2 P1'
define view ZCS_CDS_002_P1 as select from vbrp      as t1
                               inner join vbrk      as t2 on t1.vbeln = t2.vbeln
                               inner join mara      as t3 on t1.matnr = t3.matnr
                               left outer join vbak as t4 on t1.aubel = t4.vbeln
                               left outer join kna1 as t5 on t4.kunnr = t5.kunnr
                               left outer join makt as t6 on t3.matnr = t6.matnr
                                                         and t6.spras = $session.system_language 
{
    t1.vbeln,
    t1.posnr,
    t1.aubel,
    t1.aupos,
    t4.kunnr,
    concat_with_space( t5.name1, t5.name2, 1 ) as name,
    left( t4.kunnr, 3 )                        as left_kunnr,
    length( t3.matnr )                         as matnr_lenght,
    case t2.fkart when 'FAS' then 'Peşinat talebi iptali'
                  when 'FAZ' then 'Peşinat talebi'
                  else 'Fatura' 
    end as fatura_tur,
    t2.fkdat,
    currency_conversion( amount => t1.netwr,
                         exchange_rate_date => t2.fkdat,
                         source_currency    => t2.waerk,
                         target_currency    => cast ('EUR' as abap.cuky ) )  as conversion_netwr,
    t2.inco2_l
}
