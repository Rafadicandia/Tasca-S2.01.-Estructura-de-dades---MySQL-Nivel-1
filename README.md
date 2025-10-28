
## 📄 Description - Exercise Statement


### Exercise 1 - Optics

An optician's shop, called "Cul d'Ampolla" (Bottle Bottom), wants to computerize the management of its clients and glasses sales.

Firstly, the optician wants to know who the supplier is for each pair of glasses. Specifically, they want to know the following about each **supplier**:

* Name
* Address (street, number, floor, door, city, postal code, and country)
* Phone
* Fax
* NIF (Tax Identification Number).

The optician's purchasing policy is based on buying glasses of one brand from a **single supplier** (to get better prices), but they can buy glasses of **various brands from one supplier**.

Regarding the **glasses**, they want to know:

* Brand.
* The prescription (gradation) of each lens.
* The frame type (rimless, acetate/plastic, or metal).
* The frame color.
* The color of each lens.
* The price.

Regarding **clients**, they want to store:

* Name.
* Postal address.
* Phone.
* Email.
* Registration date.
* When a new client arrives, store the **client who recommended** the establishment to them (only if someone recommended them).

Our system must indicate which **employee** sold each pair of glasses.

---

### Exercise 2 - Pizzeria

You have been hired to design a website that allows ordering food delivery online.

Keep the following indications in mind to model what the project's database would look like:

For each **client**, we store a unique identifier:

* First Name.
* Last Names.
* Address.
* Postal Code.
* Town/City.
* Province.
* Phone number.

The **town/city** and **province** data will be stored in separate tables. We know that a town/city belongs to a single province, and a province can have many towns/cities. For each **town/city**, we store a unique identifier and a name. For each **province**, we store a unique identifier and a name.

A person can place many **orders**, but a single order can only be placed by one person. For each **order**, a unique identifier is stored:

* Date/time.
* If the order is for home delivery or for store pickup.
* The quantity of products selected for each type.
* The total price.

An order can consist of one or more **products**.

The **products** can be pizzas, burgers, and drinks. For each product, a unique identifier is stored:

* Name.
* Description.
* Image.
* Price.

In the case of pizzas, there are various **categories** whose names can change throughout the year. A pizza can only be in one category, but a category can have many pizzas.

For each **category**, a unique identifier and a name are stored.

An order is managed by a single **store**, and a store can manage many orders. For each **store**, a unique identifier is stored:

* Address.
* Postal Code.
* Town/City.
* Province.

Many **employees** can work in one store, and an employee can only work in one store. For each **employee**, a unique identifier is stored:

* First Name.
* Last Names.
* NIF (Tax Identification Number).
* Phone.
* Whether they work as a cook or a delivery driver.

For home delivery orders, it is important to save who the **delivery driver** making the delivery is and the **date/time** of the delivery.
-----

## 💻 Used Technologies

| Technology | Version | Description |
| :--- | :--- | :--- |
| **MySQL** | Latest Official Image | The database server running inside the Docker container. |
| **Docker** | Latest | Containerization platform for setting up the environment. |
-----

## 📋 Requirements

- Operating System: Windows/macOS/Linux.
- **Docker Desktop:** Installed and running (essential for the database setup).
- **MySQL Client:** MySQL Workbench, DBeaver, or any other client to connect and verify the data.
-----

## 🛠️ Installation

1.  **Clone the Repository:**

    ```bash
    git clone https://github.com/Rafadicandia/Tasca-S2.01.-Estructura-de-dades---MySQL-Nivel-1.git
    ```
    
2. Start the MySQL Container (Automatic Data Load)
   The following command starts the container, maps host port 3307 to container port 3306, and automatically executes the init.sql script located in the database/ folder.
   ```bash 
    docker run -d \
   --name mysql-java-db \
   -e MYSQL_ROOT_PASSWORD=Rafael4716 \
   -p 3307:3306 \
   -v mysql-data:/var/lib/mysql \
   -v $(pwd)/database:/docker-entrypoint-initdb.d \
   mysql
    ```

3. Verification
   Confirm that the container is running:

    ```bash
    docker ps
    ````
    The output should show the mysql-java-db container with the Up status.

-----

## ▶️ Execution

🔌 Database Connection Details
Use the following parameters to connect your application (Java, Python, etc.) or your MySQL Workbench client:

Parameter,Value
Host/Address,localhost or 127.0.0.1
Port,3307 (Mapped port)
User,root
Password,Rafael4716

-----

## 🤝 Contributions

Contributions are welcome. Please report any bugs by opening an issue or suggest improvements via a clear and concise Pull Request.