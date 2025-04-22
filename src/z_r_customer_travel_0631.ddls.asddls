@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS – Business Object'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_R_CUSTOMER_TRAVEL_0631
  as select from zcustomers_0631

  association [0..1] to /DMO/I_Customer as _Customer on _Customer.CustomerID = $projection.CustomerId

{
  key customer_uuid         as CustomerUuid,
  key customer_id           as CustomerId,
  key flight_date           as FlightDate,
      description           as Description,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      overall_status        as OverallStatus,


      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,

      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,

      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      //    _association_name // Make association public
      _Customer
}
