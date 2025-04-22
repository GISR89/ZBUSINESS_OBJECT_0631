@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS – Business Object'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_I_CUSTOMER_TRAVEL_0631
  provider contract transactional_interface
  as projection on Z_R_CUSTOMER_TRAVEL_0631
{
  key CustomerUuid,
  key CustomerId,
  key FlightDate,
      Description,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      Price,
      CurrencyCode,
      OverallStatus,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,
      /* Associations */
      _Customer
}
