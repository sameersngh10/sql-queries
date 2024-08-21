SELECT * FROM test.products;
 use test;

SELECT COUNT(*)  FROM test.products where product_status = 'APPROVED';
SELECT COUNT(*) FROM test.products where product_status ='REJECTED';
SELECT COUNT(*) FROM test.products where product_status ='MODIFYED';
SELECT COUNT(*) FROM test.products where product_status ='NEW';
SELECT COUNT(*) FROM test.products where product_status ='DRAFT';

/// searchproductbyID
-- add product 
-- update product
