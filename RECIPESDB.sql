-- Create database
CREATE DATABASE RecipeDatabase;

-- Switch to the created database
USE RecipeDatabase;

-- Create TypesOfDish table
CREATE TABLE TypesOfDish (
    type_of_dish_id INT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(50) UNIQUE
);

-- Create Ingredients table
CREATE TABLE Ingredients (
    ingredient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) UNIQUE
);

-- Create Recipes table
CREATE TABLE Recipes (
    recipe_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    type_of_dish_id INT,
    type_name VARCHAR(50),
    rating DECIMAL(3, 1),
    preparation_time INT, -- in minutes
    method TEXT,
    FOREIGN KEY (type_of_dish_id) REFERENCES TypesOfDish(type_of_dish_id)
);

-- Insert dummy types of dishes
INSERT INTO TypesOfDish (type_name) VALUES
('Main Dish'),
('Dessert'),
('Salad'),
('Breakfast'),
('Side Dish'),
('Drink');

-- Insert dummy ingredients
INSERT INTO Ingredients (name) VALUES
('Chicken'),
('Rice'),
('Tomatoes'),
('Potatoes'),
('Flour'),
('Sugar'),
('Milk'),
('Eggs'),
('Lettuce'),
('Cucumber'),
('Lemon'),
('Cheese'),
('Onion');

-- Insert dummy recipes
INSERT INTO Recipes (name, type_of_dish_id,type_name, rating, preparation_time, method)
VALUES 
('Chicken Curry', 1,'Main Dish', 4.2, 60, '1. Marinate chicken with spices. 2. Cook chicken with onions and tomatoes. 3. Add curry paste and simmer.'),
('Chocolate Cake',2, 'Dessert', 4.8, 45, '1. Mix flour, sugar, and cocoa powder. 2. Add eggs and milk. 3. Bake in the oven.'),
('Caesar Salad', 3,'Salad', 4.5, 15, '1. Chop lettuce and cucumber. 2. Prepare dressing with lemon juice, olive oil, and cheese. 3. Toss everything together.'),
('Pancakes', 4,'Breakfast',3, 30, '1. Mix flour, eggs, milk, and sugar. 2. Cook on a griddle until golden brown.'),
('Mashed Potatoes',5, 'Side Dish', 4.0, 20, '1. Boil potatoes until tender. 2. Mash potatoes with butter and milk. 3. Season with salt and pepper.'),
('Margarita', 6,'Drink', 4.7, 5, '1. Mix tequila, triple sec, and lime juice. 2. Serve over ice.'),
('Chicken Biryani', 1,'Main Dish', 4.5, 60, '1. Cook rice. 2. Cook chicken with spices. 3. Layer rice and chicken. 4. Cook together.'),
('Gulab Jamun', 2, 'Dessert',4.8, 45, '1. Prepare dough with flour and milk powder. 2. Shape into balls and fry. 3. Soak in sugar syrup.'),
('Samosa', 5,'Side Dish', 4.3, 30, '1. Prepare dough with flour. 2. Fill with potato and spice mixture. 3. Fry until golden brown.'),
('Palak Paneer', 1,'Main Dish', 4.7, 40, '1. Cook spinach and blend. 2. Cook paneer with onions and tomatoes. 3. Add spinach mixture.'),
('Masala Chai', 6, 'Side Dish',4.6, 15, '1. Boil water with tea leaves and spices. 2. Add milk and sugar. 3. Strain and serve.');
SELECT * FROM TypesOfDish;
 
 SELECT * FROM Recipes;
 
 select * from Ingredients;

-- Retrieve all recipes for a specific type of dish (e.g., Main Dish):
SELECT * FROM Recipes WHERE type_name = 'Main Dish';

-- Retrieve recipes with a rating higher than 4.5:

SELECT * FROM Recipes WHERE rating > 4.5;

-- Adding a new recipe to base
INSERT INTO Recipes (name, type_of_dish_id, type_name, rating, preparation_time, method)
VALUES ('Vegetable Stir Fry', 1, 'Main Dish', 4.6, 25, '1. Stir-fry vegetables in a wok. 2. Add sauce and cook until tender.');

 SELECT * FROM Recipes;
 
 -- to retrive a recipe with particular ingredients
SELECT r.* 
FROM Recipes r
INNER JOIN RecipeIngredients ri ON r.recipe_id = ri.recipe_id
INNER JOIN Ingredients i ON ri.ingredient_id = i.ingredient_id
WHERE i.name = 'paneer';

-- Retrieve recipes ordered by their ratings in descending order:
SELECT * FROM Recipes ORDER BY rating DESC;






