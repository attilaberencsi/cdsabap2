@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales Order Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity ZATB_I_SalesOrderItem
  as select from zatb_salesorderi
  association [0..1] to ZATB_I_Product as _Product on $projection.Product = _Product.Product

{
  key salesorder          as SalesOrder,
  key salesorderitem      as SalesOrderItem,
      product             as Product,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      orderquantity       as OrderQuantity,
      orderquantityunit   as OrderQuantityUnit,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      netamount           as NetAmount,
      transactioncurrency as TransactionCurrency,
      creationdate        as CreationDate,
      _Product
}
