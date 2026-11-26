# Customers and Products Analysis Using SQL
Open stores.db in DB Browser for SQLite and run Store_Analysis.sql in the Execute SQL tab. The tables below are the results from the supplied database.
## Database overview
| table_name | columns | rows |
| --- | --- | --- |
| customers | 13 | 122 |
| employees | 8 | 23 |
| offices | 9 | 7 |
| orderdetails | 5 | 2996 |
| orders | 7 | 326 |
| payments | 4 | 273 |
| productlines | 4 | 7 |
| products | 9 | 110 |

## Restocking shortlist
| productName | quantityInStock | units_ordered | demand_to_stock | ordered_sales |
| --- | --- | --- | --- | --- |
| 1968 Ford Mustang | 68 | 933 | 13.72 | 161531.48 |
| 1928 Mercedes-Benz SSK | 548 | 880 | 1.61 | 132275.98 |
| 1997 BMW F650 ST | 178 | 1014 | 5.7 | 89364.89 |
| F/A 18 Hornet 1/72 | 551 | 1047 | 1.9 | 76618.4 |
| 2002 Yamaha YZR M1 | 600 | 992 | 1.65 | 73670.64 |
| The Mayflower | 737 | 898 | 1.22 | 69531.61 |
| 1960 BSA Gold Star DBD34 | 15 | 1015 | 67.67 | 67193.49 |
| 1928 Ford Phaeton Deluxe | 136 | 972 | 7.15 | 60493.33 |
| Pont Yacht | 414 | 958 | 2.31 | 47550.4 |
| 1911 Ford Town Car | 540 | 832 | 1.54 | 45306.77 |

## Products to review before reordering
| productName | quantityInStock | units_ordered | demand_to_stock |
| --- | --- | --- | --- |
| 1985 Toyota Supra | 7733 | 0 | 0.0 |
| 1995 Honda Civic | 9772 | 917 | 0.094 |
| 2002 Chevy Corvette | 9446 | 894 | 0.095 |
| 1982 Ducati 996 R | 9241 | 906 | 0.098 |
| 1976 Ford Gran Torino | 9127 | 915 | 0.1 |

## Customer segments
| segment | customerName | contactFirstName | contactLastName | city | country | profit |
| --- | --- | --- | --- | --- | --- | --- |
| VIP | Euro+ Shopping Channel | Diego  | Freyre | Madrid | Spain | 326519.66 |
| VIP | Mini Gifts Distributors Ltd. | Susan | Nelson | San Rafael | USA | 236769.39 |
| VIP | Muscle Machine Inc | Jeff | Young | NYC | USA | 72370.09 |
| VIP | Australian Collectors, Co. | Peter | Ferguson | Melbourne | Australia | 70311.07 |
| VIP | La Rochelle Gifts | Janine  | Labrune | Nantes | France | 60875.3 |
| Lower profit | Double Decker Gift Stores, Ltd | Thomas  | Smith | London | UK | 10868.04 |
| Lower profit | Atelier graphique | Carine  | Schmitt | Nantes | France | 10063.8 |
| Lower profit | Frau da Collezione | Franco | Ricotti | Milan | Italy | 9532.93 |
| Lower profit | Auto-Moto Classics Inc. | Leslie | Taylor | Brickhaven | USA | 6586.02 |
| Lower profit | Boards & Toys Co. | Mary | Young | Glendale | USA | 2610.87 |

## Customer acquisition benchmark
| purchasing_accounts | historical_value |
| --- | --- |
| 98 | 39039.59 |

## Shipped orders only
| shipped_accounts | shipped_value |
| --- | --- |
| 98 | 36097.22 |

## Decisions

- Review the 1968 Ford Mustang first. Among the ten models with the highest historical units ordered relative to stock, it generated the most ordered sales ($161,531.48). The database shows 933 units ordered and 68 on hand. Check recent demand and supplier lead time before setting the reorder quantity.
- Defer new orders for the 1985 Toyota Supra pending a listing and inventory check. The catalog shows 7,733 units on hand and no matching order lines.
- Prioritize account retention for Euro+ Shopping Channel and Mini Gifts Distributors Ltd., which contributed $326,519.66 and $236,769.39 in historical gross profit. Test inexpensive outreach for lower-profit buyers and check account age before increasing marketing spend.
- Across the 98 purchasing accounts, average observed gross profit was $39,039.59. Restricting the calculation to shipped orders gives $36,097.22. Both figures exclude fulfillment, servicing and marketing costs. Set an acquisition budget using expected gross profit over the target payback period minus those costs and the required profit margin. The database does not establish a specific acquisition price.
