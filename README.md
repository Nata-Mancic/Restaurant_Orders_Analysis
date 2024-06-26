# Restaurant Orders Analysis

This is a project related to a fictional Taste of the World Café,
a restaurant that has diverse menu offerings and serves generous portions. 
The Taste of the World Café debuted a new menu at the start of the year.

The key to the analysis is to dig into the customer data to see which of the
menu items are doing well and what the top customers like the most. 

## Dataset
A quarter's worth of orders from a fictitious restaurant serving international cuisine,
including the date and time of each order, the items ordered,
and additional details on the type, name and price of the items.

There are two tables in the database:
* Restaurant Sales Menu Items
* Restaurant Sales Order Details

The date range is from 01/01/2023 to 31/03/2023.

**Note**: project idea and data are taken from the Maven Analytics website.

## Tools
* **Data analysis**: PostgreSQL
* **Data visualization**: Tableau

## Analysis
After thorough research of Sales Order Details table and Restaurant Sales Menu Items table separately,
I combined them by using left outer joint (I used left joint in order to keep all transactions from the
order details table and match those information with data from the menu items table).

In order to determine which of the items from the new menu did well in the first quarter I answered to the following questions:
* What were the least and most ordered items? What categories were they in?
* What do the highest spend orders look like? Which items did they buy and how much did they spend?
* Were there certain times that had more or less orders?
* Which cuisines should we focus on developing more menu items for based on the data?

You can check the queries [here]().

## Results
