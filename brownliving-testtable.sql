

USE test;
SELECT * FROM test.variants;
SELECT DISTINCT p.* FROM products p JOIN variants v ON p.id = v.product_id WHERE v.inventory_quantity < 0;
SELECT * FROM test.products ;

INSERT INTO test.variants (
    id,
    product_id,
    title,
    price,
    sku,
    position,
    inventory_policy,
    compare_at_price,
    fulfillment_service,
    inventory_management,
    option1,
    option2,
    option3,
    created_at,
    updated_at,
    taxable,
    barcode,
    grams,
    weight,
    weight_unit,
    inventory_item_id,
    inventory_quantity,
    old_inventory_quantity,
    requires_shipping,
    image_id
) VALUES (
    102, 1, 'Sample Product 2', 15, 'SKU12346', 1, 'adam', 25, 'manual', 'brown living', 'Black', 'M', 'Cotton', '2024-07-26 10:00:00', '2024-07-26 10:00:00', true, '1234567890126', 500, 150, 'g', 1001, 11, 6, true, 'IMG002'
);
SELECT * from test.variants where id =102;

INSERT INTO test.products (
    id,
    title,
    body_html,
    vendor,
    product_type,
    created_at,
    handle,
    updated_at,
    published_scope,
    tags,
    status
) VALUES (
    5, 'Sample Product', '<p>This is a sample product description.</p>', 'Brown Living', 'Shirt', '2024-07-26 10:00:00', 'sample-product', '2024-07-26 10:00:00', 'global', 'sample, product, shirt', 'edit'
);

SELECT * FROM test.products;

update test.products set  status= 'rejected' where id =2;

