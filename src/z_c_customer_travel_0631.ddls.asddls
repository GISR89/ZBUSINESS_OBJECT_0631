@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS – Business Object'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity Z_C_CUSTOMER_TRAVEL_0631
  provider contract transactional_query
  as projection on Z_R_CUSTOMER_TRAVEL_0631
{
  key     CustomerUuid,

          @Search.defaultSearchElement: true
          @Search.fuzzinessThreshold: 0.8
          @Search.ranking: #HIGH
          @ObjectModel.text.element: [ 'CustomerName' ]
  key     CustomerId,

          @Search.defaultSearchElement: true
          @Search.fuzzinessThreshold: 0.8
          @Search.ranking: #MEDIUM
  key     FlightDate,
          _Customer.LastName                   as CustomerName,

          Description,
          @Semantics.amount.currencyCode : 'CurrencyCode'
          Price,
          @EndUserText.label: 'VAT Included'
          @Semantics.amount.currencyCode : 'CurrencyCode'
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VIRT_EMEM_SADL_PRICE_0631'
  virtual PriceWithTax : /dmo/flight_price,
          CurrencyCode,
          OverallStatus,

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
