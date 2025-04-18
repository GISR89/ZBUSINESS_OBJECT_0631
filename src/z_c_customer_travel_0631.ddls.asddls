@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS – Business Object'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
define root view entity Z_C_CUSTOMER_TRAVEL_0631
  provider contract transactional_query
  as projection on Z_R_CUSTOMER_TRAVEL_0631
{
  key CustomerUuid,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      @ObjectModel.text.element: [ 'CustomerName' ]
  key CustomerId,
      _Customer.LastName                   as CustomerName,

      Description,

      @ObjectModel.text.element: [ 'CountryName' ]
      _Customer._Country._Text.CountryName as CountryName : localized,

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
