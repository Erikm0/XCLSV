INSERT INTO `products` VALUES (1, "Fehér póló", "Rövid ujjú póló", "Szép póló", "Fehér", "https://xclsv-images.s3.eu-north-1.amazonaws.com/085bed10-49c5-4abd-995c-91cf946bd4b1__vyrn_116GI5000-póló-White.jpg", "M", 1990, 1, NOW(), NOW(), NULL);
INSERT INTO `products` VALUES (2, "Fekete póló", "Rövid ujjú póló", "Szép póló", "Fekete", "https://xclsv-images.s3.eu-north-1.amazonaws.com/ad265db2-e20a-4009-a175-6120e07ada83_9801c95b.jpg", "S", 1990, 1, NOW(), NOW(), NULL);
INSERT INTO `products` VALUES (3, "Szürke póló", "Rövid ujjú póló", "Egyszínű póló", "Szürke", "https://xclsv-images.s3.eu-north-1.amazonaws.com/8c855901-3c14-4727-972a-376d4feae8e5_fol-ferfi-v-nyaku-polo-hamuszurke.jpg", "M", 1490, 1, NOW(), NOW(), NULL);
INSERT INTO `products` VALUES (4, "Feliratos póló", "Rövid ujjú póló", "Mintás póló", "Fekete", "https://xclsv-images.s3.eu-north-1.amazonaws.com/ed5d6751-e93a-4bee-9744-64471ae33453_polo-egyedi-felirattal-fekete-hatul.png", "M", 2990, 1, NOW(), NOW(), NULL);
INSERT INTO `products` VALUES (5, "Zöld pulcsi", "Pulóver", "Szép pulóver", "Zöld", "https://xclsv-images.s3.eu-north-1.amazonaws.com/d5d04a5b-7fb5-4c69-bd58-68716e367cb5_images.jpg", "L", 8990, 1, NOW(), NOW(), NULL);


INSERT INTO `customers` VALUES (1, "Teszt", "Elek", "tesztelek@gmail.com", "+36500000000", 0, "$2a$11$S94bE6TZFUlriuDVBrBaBur9HxpOq5xPugvg4A8DuVAx1cXdq2LK2", NULL, "2099-11-06", NULL, NOW(), NOW(), NULL);
INSERT INTO `customers` VALUES (2, "Kis", "Pista", "kispista@gmail.com", "+36500000000", 0, "$2a$11$S94bE6TZFUlriuDVBrBaBur9HxpOq5xPugvg4A8DuVAx1cXdq2LK2", NULL, "2099-11-06", NULL, NOW(), NOW(), NULL);
INSERT INTO `customers` VALUES (3, "Vicc", "Elek", "viccelek@gmail.com", "+36500000000", 0, "$2a$11$S94bE6TZFUlriuDVBrBaBur9HxpOq5xPugvg4A8DuVAx1cXdq2LK2", NULL, "2099-11-06", NULL, NOW(), NOW(), NULL);
INSERT INTO `customers` VALUES (4, "Till", "Attila", "tillattila@gmail.com", "+36500000000", 0, "$2a$11$S94bE6TZFUlriuDVBrBaBur9HxpOq5xPugvg4A8DuVAx1cXdq2LK2", NULL, "2099-11-06", NULL, NOW(), NOW(), NULL);


INSERT INTO order_status_codes (id, status_code, description, created_at, updated_at, deleted_at) VALUES
(1, 1, 'pending', NOW(), NOW(), NULL),
(2, 2, 'processing', NOW(), NOW(), NULL),
(3, 3, 'shipped', NOW(), NOW(), NULL),
(4, 4, 'completed', NOW(), NOW(), NULL),
(5, 5, 'cancelled', NOW(), NOW(), NULL),
(6, 6, 'failed', NOW(), NOW(), NULL),
(7, 7, 'refunded', NOW(), NOW(), NULL);


INSERT INTO `orders` VALUES (1, 1, 4, 3980, NOW(), NOW(), NOW());
INSERT INTO `orders` VALUES (2, 2, 4, 4980, NOW(), NOW(), NOW());
INSERT INTO `orders` VALUES (3, 3, 1, 8990, NOW(), NOW(), NOW());
INSERT INTO `orders` VALUES (4, 4, 4, 13470, NOW(), NOW(), NOW());


INSERT INTO `order_items` VALUES (1, 1, 1, 1, 1990, NOW(), NOW());
INSERT INTO `order_items` VALUES (2, 1, 2, 1, 1990, NOW(), NOW());
INSERT INTO `order_items` VALUES (3, 2, 1, 1, 1990, NOW(), NOW());
INSERT INTO `order_items` VALUES (4, 2, 4, 1, 2990, NOW(), NOW());
INSERT INTO `order_items` VALUES (5, 3, 5, 1, 8990, NOW(), NOW());
INSERT INTO `order_items` VALUES (6, 4, 3, 1, 1490, NOW(), NOW());
INSERT INTO `order_items` VALUES (7, 4, 4, 1, 2990, NOW(), NOW());


INSERT INTO `admins` VALUES (1, "teszt@xclsv.com", "$2a$11$S94bE6TZFUlriuDVBrBaBur9HxpOq5xPugvg4A8DuVAx1cXdq2LK2",NOW(), NOW(), NULL);
INSERT INTO `admins` VALUES (2, "balazs@xclsv.com", "$2a$11$S94bE6TZFUlriuDVBrBaBur9HxpOq5xPugvg4A8DuVAx1cXdq2LK2", NOW(), NOW(), NULL);

INSERT INTO order_status_codes (id, status_code, description, created_at, updated_at, deleted_at) VALUES
(1, 1, 'pending', NOW(), NOW(), NULL),
(2, 2, 'processing', NOW(), NOW(), NULL),
(3, 3, 'shipped', NOW(), NOW(), NULL),
(4, 4, 'completed', NOW(), NOW(), NULL),
(5, 5, 'cancelled', NOW(), NOW(), NULL),
(6, 6, 'failed', NOW(), NOW(), NULL),
(7, 7, 'refunded', NOW(), NOW(), NULL);