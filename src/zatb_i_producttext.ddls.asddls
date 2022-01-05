@EndUserText.label: 'Product Text'
@AccessControl.authorizationCheck: #CHECK
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Product'
@ObjectModel.dataCategory: #TEXT
@Search.searchable: true
define view entity ZATB_I_ProductText
  as select from zatb_producttext
  association to parent ZATB_I_Product as _Product on $projection.Product = _Product.Product
{
      @Semantics.language: true
  key language     as Language,
      @ObjectModel.text.element:['ProductName']
  key product      as Product,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      @Semantics.text: true
      product_name as ProductName,
      _Product
}
