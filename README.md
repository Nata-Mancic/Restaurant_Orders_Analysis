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

You can check the SQL queries [here](https://github.com/Nata-Mancic/Restaurant_Orders_Analysis/blob/main/Restaurant_project.sql).

## Results
I created following graphs using Tableau. The workbook is published on [Tableau public](https://public.tableau.com/app/profile/natalija.mancic/viz/restaurant_project_17198368307700/RestaurantOrdersAnalysis?publish=yes). 

There were totaly **5,370** orders made from 2023-01-01 to 2023-03-31, and **12,234** sold items.

The most ordered items were **Hamburgers** with 622 orders and **Edamame** with 620 orders. The least ordered item was **Chicken Tacos** which was ordered 123 times. 

![image](https://github.com/Nata-Mancic/Restaurant_Orders_Analysis/assets/173147286/9607d971-85c4-4aea-b316-3e17a4933fc6)

Items from **Asian** category were ordered the most (3,470 times), while items from **American** category were ordered the least (2,734 times).

![image](https://github.com/Nata-Mancic/Restaurant_Orders_Analysis/assets/173147286/9374f379-ebd2-4ac1-90d7-5adc5eea1be0)

Top 5 orders that spent the most money are: 440, 2075, 1957, 330, and 2675.

![image](https://github.com/Nata-Mancic/Restaurant_Orders_Analysis/assets/173147286/c45bf3ae-302f-4df4-acf7-c47e758150d4)

From top 5 highest spend orders, items that were order the most are from **Italian** category (26 items or 37.68%), while the least ordered items are from **American** category (10 items or 14.49%).

![image](https://github.com/Nata-Mancic/Restaurant_Orders_Analysis/assets/173147286/d445bced-b01e-4d4f-85df-7fc28c2bc282)   ![image](https://github.com/Nata-Mancic/Restaurant_Orders_Analysis/assets/173147286/d4b0d96a-54e0-42fd-8836-9e5a46830787)

The following graph shows the items that were ordered in the top 5 highest spend orders grouped by category. Item that was paid the most is **Eggplant Parmesan** from Italian category ($118.7).

![image](https://github.com/Nata-Mancic/Restaurant_Orders_Analysis/assets/173147286/6754cb09-49d0-4b86-aabe-fda0b8a6d2a8)


## Conclusions 

1. Hamburgers and Edamame were the most frequently ordered items, suggesting strong customer preference for these options. Therefore promoting these can benefit the restaurants profit.
2. Chicken Tacos had significantly fewer orders compared to other menu items. This might indicate that they need better preparation, pricing, or promotion to make them more appealing.
3. The top-spending orders included a variety of items, but Italian cuisine was mostly ordered. This suggests that customers are willing to spend more on Italian dishes. Highlight and promoting Italian cuisine could potentialy increase profit.
