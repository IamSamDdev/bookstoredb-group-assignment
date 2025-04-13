# Bookstore Database Project - README

## Project Overview
This project implements a comprehensive MySQL database system for a bookstore management system. The database tracks books, authors, customers, orders, and shipping information to support all bookstore operations.

## Team Members
- [Presley Oluoch   presleyoluoch@gmail.com] - [Database Architect ]
- [Samuel Friday    samuelfriday579@gmail.com] - [Data Specialist]
- [Abraham Thuleile Eisimbaltor    thuleilea@gmail.com] - [ERD diagraming. ]


## Database Schema
The database consists of 15 interrelated tables that model:
- Book inventory (books, authors, publishers, languages)
- Customer information (customers, addresses)
- Order processing (orders, order lines, order history)
- Shipping methods and statuses

## File Structure
```
bookstore-db/
├── database_schema.sql       # Complete database structure
├── sample_data.sql          # Sample data for all tables
├── user_management.sql      # User accounts and permissions
├── example_queries.sql      # Demonstration queries
├── bookstore_erd.drawio     # Entity Relationship Diagram (editable)
├── bookstore_erd.png        # ER Diagram (image)
└── README.md                # This documentation file
```

## Installation Instructions

### Prerequisites
- MySQL Server (8.0+ recommended)
- MySQL Workbench or command line client
- Draw.io (for viewing/editing the ER diagram)

### Setup Steps
1. Clone this repository:
   ```bash
   git clone [repository-url]
   cd bookstore-db
   ```

2. Create and populate the database:
   ```bash
   mysql -u root -p
   ```
   ```sql
   -- In MySQL client:
   SOURCE database_schema.sql;
   SOURCE sample_data.sql;
   SOURCE user_management.sql;
   ```

3. Verify installation by running test queries:
   ```sql
   USE bookstore;
   SOURCE example_queries.sql;
   ```

## Key Features
- **Complete Book Management**: Track all book details including multiple authors per book
- **Customer Profiles**: Store customer information with multiple addresses
- **Order Processing**: Full order lifecycle from creation to delivery
- **Inventory Control**: Monitor stock levels and sales
- **User Security**: Role-based access control for different staff functions

## Example Use Cases
1. **Inventory Management**:
   - Check low stock items
   - Add new books to inventory
   - Update book information

2. **Customer Service**:
   - Process new orders
   - Check order status
   - Update customer profiles

3. **Business Intelligence**:
   - Sales reporting by period
   - Top-selling books analysis
   - Customer purchasing patterns

## ER Diagram
![Database Schema Diagram](bookstore_erd.png)

The diagram shows all tables and their relationships. Open `bookstore_erd.drawio` to explore interactively.

## User Accounts
The system includes these pre-configured users:

| Username               | Password    | Role               | Permissions                     |
|------------------------|-------------|--------------------|---------------------------------|
| bookstore_admin        | Admin@1234  | Database Admin     | Full privileges                 |
| bookstore_inventory    | Inv@5678    | Inventory Manager  | Book/author/publisher management|
| bookstore_service      | Service@9012| Customer Service   | Customer/order management       |
| bookstore_report       | Report@3456 | Reporting          | Read-only access                |
| bookstore_app          | App@7890    | Application        | Standard CRUD operations        |

## Testing
Run the example queries from `example_queries.sql` to verify:
1. Inventory status reports
2. Customer order history
3. Sales analytics
4. Shipping performance

## Contribution Guidelines
1. Create a new branch for your changes
2. Test all SQL scripts thoroughly
3. Update documentation when making schema changes
4. Submit pull requests for review

