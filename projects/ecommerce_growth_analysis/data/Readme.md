## Table Schemas

### 1. `website_sessions`
This table tracks user sessions on the website, storing details about each session.

| Column               | Data Type             | Primary Key  | Description                                                       |
|----------------------|-----------------------|--------------|--------------------------------------------------------------------|
| `website_session_id` | BIGINT UNSIGNED       | ✔            | Unique ID for each website session.                               |
| `created_at`         | DATETIME              |              | Timestamp when the session was created.                            |
| `user_id`            | BIGINT UNSIGNED       |              | Unique ID of the user associated with the session.                 |
| `is_repeat_session`  | SMALLINT UNSIGNED     |              | Indicator if the session is a repeat session (1) or not (0).       |
| `utm_source`         | VARCHAR(12)           |              | Source from which the session originated (e.g., Google, Facebook). |
| `utm_campaign`       | VARCHAR(20)           |              | Campaign name associated with the session.                         |
| `utm_content`        | VARCHAR(15)           |              | Content label for specific link tracking.                          |
| `device_type`        | VARCHAR(15)           |              | Device type used during the session (e.g., mobile, desktop).       |
| `http_referer`       | VARCHAR(30)           |              | Referring URL for the session.                                     |

### 2. `website_pageviews`
Tracks individual pageviews within a session.

| Column               | Data Type             | Primary Key  | Description                                                      |
|----------------------|-----------------------|--------------|------------------------------------------------------------------|
| `website_pageview_id`| BIGINT UNSIGNED       | ✔            | Unique ID for each pageview.                                     |
| `created_at`         | DATETIME              |              | Timestamp when the pageview occurred.                            |
| `website_session_id` | BIGINT UNSIGNED       |              | ID of the associated session. Foreign Key to `website_sessions`. |
| `pageview_url`       | VARCHAR(50)           |              | URL of the page viewed.                                          |

### 3. `products`
Stores details about products available on the website.

| Column               | Data Type             | Primary Key  | Description                              |
|----------------------|-----------------------|--------------|------------------------------------------|
| `product_id`         | BIGINT UNSIGNED       | ✔            | Unique ID for each product.              |
| `created_at`         | DATETIME              |              | Timestamp when the product was added.    |
| `product_name`       | VARCHAR(50)           |              | Name of the product.                     |

### 4. `orders`
Stores order information for completed purchases.

| Column               | Data Type             | Primary Key | Description                                                                             |
|----------------------|-----------------------|-------------|-----------------------------------------------------------------------------------------|
| `order_id`           | BIGINT UNSIGNED       | ✔           | Unique ID for each order.                                                               |
| `created_at`         | DATETIME              |             | Timestamp when the order was placed.                                                    |
| `website_session_id` | BIGINT UNSIGNED       |             | ID of the session during which the order was placed. Foreign Key to `website_sessions`. |
| `user_id`            | BIGINT UNSIGNED       |             | ID of the user placing the order.                                                       |
| `primary_product_id` | SMALLINT UNSIGNED     |             | ID of the primary product in the order.                                                 |
| `items_purchased`    | SMALLINT UNSIGNED     |             | Total number of items purchased.                                                        |
| `price_usd`          | DECIMAL(6,2)          |             | Total price of the order in USD.                                                        |
| `cogs_usd`           | DECIMAL(6,2)          |             | Cost of goods sold for the order in USD.                                                |

### 5. `order_items`
Stores information on individual items within an order.

| Column               | Data Type             | Primary Key  | Description                                               |
|----------------------|-----------------------|--------------|-----------------------------------------------------------|
| `order_item_id`      | BIGINT UNSIGNED       | ✔            | Unique ID for each item in an order.                      |
| `created_at`         | DATETIME              |              | Timestamp when the item was added to the order.           |
| `order_id`           | BIGINT UNSIGNED       |              | ID of the associated order. Foreign Key to `orders`.      |
| `product_id`         | SMALLINT UNSIGNED     |              | ID of the product purchased.                              |
| `is_primary_item`    | SMALLINT UNSIGNED     |              | Indicator if the item is the primary item (1) or not (0). |
| `price_usd`          | DECIMAL(6,2)          |              | Price of the individual item in USD.                      |
| `cogs_usd`           | DECIMAL(6,2)          |              | Cost of goods sold for the item in USD.                   |

### 6. `order_item_refunds`
Tracks refund details for individual order items.

| Column               | Data Type             | Primary Key  | Description                                            |
|----------------------|-----------------------|--------------|--------------------------------------------------------|
| `order_item_refund_id` | BIGINT UNSIGNED    | ✔             | Unique ID for each refund transaction.                 |
| `created_at`         | DATETIME              |              | Timestamp when the refund was processed.               |
| `order_item_id`      | BIGINT UNSIGNED       |              | ID of the refunded item. Foreign Key to `order_items`. |
| `order_id`           | BIGINT UNSIGNED       |              | ID of the associated order. Foreign Key to `orders`.   |
| `refund_amount_usd`  | DECIMAL(6,2)          |              | Amount refunded in USD.                                |
