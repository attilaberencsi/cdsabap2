@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales Order Item with Product'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity ZATB_C_SalesOrderItemProduct
  as select from           ZATB_I_SalesOrderItem as ITEM
    left outer to one join ZATB_I_Product        as PROD on PROD.Product = ITEM.Product
{
  key ITEM.SalesOrder,
  key ITEM.SalesOrderItem,
      ITEM.Product,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      ITEM.OrderQuantity,
      ITEM.OrderQuantityUnit,
      PROD.ProductType,
      PROD.CreationDateTime
}
