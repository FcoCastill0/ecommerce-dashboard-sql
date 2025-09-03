<h1>E-Commerce Dashboard SQL for JTL Wawi & Looker Studio</h1>
    <p>This repository contains all the SQL queries and views required to build a comprehensive e-commerce dashboard in Google Looker Studio, using data from a JTL Wawi (SQL Server) ERP system.</p>
    <h2>Project Goal</h2>
    <p>The objective is to create a live, reliable data pipeline from the JTL Wawi database to Google Looker Studio. This enables real-time monitoring of key business KPIs without relying on manual CSV exports.</p>
    <h2>How to Use This Project</h2>
    <ol>
        <li>
            <strong>Set up the Database (for practice):</strong>
            <ul>
                <li>Run <code>1-schema.sql</code> to create the necessary table structures.</li>
                <li>Run <code>2-data.sql</code> to populate the tables with sample data.</li>
            </ul>
        </li>
        <li>
            <strong>Connect to Looker Studio:</strong>
            <ul>
                <li>The queries in the files below are designed to be used as data sources in Google Looker Studio.</li>
            </ul>
        </li>
        <li>
            <strong>Create the Data Sources:</strong>
            <ul>
                <li><strong>Main Sales Data:</strong> Use <code>3-main-sales-query.sql</code> for all sales, profit, and customer-related analysis.</li>
                <li><strong>Operational Data:</strong> Use the queries within <code>4-operational-queries.sql</code> for inventory, purchase orders, and open customer orders.</li>
                <li><strong>Fulfillment Data:</strong> Use <code>5-orderstatus-query.sql</code> to build the order fulfillment status dashboard.</li>
            </ul>
        </li>
    </ol>
    <h2>SQL File Directory</h2>
    <ul>
        <li><code>1-schema.sql</code>: Creates the table structures for a simplified e-commerce database.</li>
        <li><code>2-data.sql</code>: Inserts sample data for testing and development.</li>
        <li><code>3-main-sales-query.sql</code>: A comprehensive query that joins sales, orders, customers, and products. This is the primary data source for financial KPIs.</li>
        <li><code>4-operational-queries.sql</code>: Contains separate queries for operational views:
            <ul>
                <li>Inventory levels and value.</li>
                <li>Open and delayed purchase orders.</li>
                <li>Open customer orders (not yet shipped).</li>
            </ul>
        </li>
        <li><code>5-orderstatus-query.sql</code>: A query to track the status of orders as they move through the fulfillment process (Pending, Picked, Packed, etc.).</li>
    </ul>
    <h1><a href="https://lookerstudio.google.com/embed/reporting/02ffb70f-303e-496c-9e87-167b2bed48ac/page/YugWF">Dashboard<a/><h1>
