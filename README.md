# Create database for my own restaurant

## Requirement
Create a database that can be shown on the restaurant's dashboard in order to track the performance of the restaurant, including
- Orders Summary
- Inventory Management
- Staff Cost

## Tools
- QuickDBD
- SQL
- Excel
- Tableau Public

## Project Workflow
### 1. Create restaurant database diagrams using [QuickDBD](https://www.quickdatabasediagrams.com/)
   The data must have for a restaurant database
- **Menu data**: This would include `item id`, `sku`, `item name`, `item category`, `item size` and `item price`.
     - This data could be used to generate orders, track inventory, and create reports.
- **Order data**: This would include `order id`, `the date and time`, `item id`, `quantity`, `customers id`, `delivery` and `address id`.
     - This data could be used to track sales, and identify popular dishes.
- **Customer data**: This would include `customer id`, `customer names`, and `customer lastname`.
     - This data could be used to identify a customer's area and provide customer support.
- **Address data**: This would include `address id`, `delivery address`, `delivery city`, and `address zipcode`.
     - This data could be used to identify customers zone, and provide customer support.
- **Ingredient data**: This would include `ingredient id`, `ingredient name`, `ingredient weight`, `ingredient measure`, and `ingredient price`.
     - This data could be used to track inventory, create recipes, and order supplies.
- **Staff data**: This would include `staff id`, `staff names`, `staff lastname`, `position`, and `hourly cost` .
     - This data could be used to track employee hoursly cost and manage payroll.
- **Inventory data**: This would include `inventory id`, `item id`, and `quantity`.
     - This data could be used to track inventory levels and order supplies.
- **Recipe data**: This would include `recipe id`, `ingredient id`, and `quantity`.
     - This data could be used to create menus and track inventory.
- **Staff's shift data**: This would include `shift id`, `week day`, `start time`, and `end time`.
     - This data could be used to create schedules, track employee hours, and manage payroll.
- **Rota data**:: This would include `rota id`, `date`, `shift id`, and `staff id`.
     - This data could be used to create schedules, track employee hours, and manage payroll.
 
### Resulted
![Screenshot 2023-07-05 033924](https://github.com/stlionnn/Lion_Restaurant/assets/98281969/8a62e1a1-1d7f-4aae-8329-dfddaecae295)

### 2. Create restaurant table data table csv file using Excel. [Restaurant's data]
### 3. Using [SQLite Online](https://sqliteonline.com/) to combine the columns and data and find the insight of restaurant data to answer the business questions.
   - [SQL scripts]
   - [Output data]
     
### 4. Using [Tableau Public](https://public.tableau.com/app/discover) to visualize data to response business question as follows
[Dash board]
   - Orders Summary
   - Inventory Management
   - Staff Cost
