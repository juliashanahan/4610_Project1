# 4610 Group Project 1

## Team Name:
Ctrl+Alt+Elite

## Team Members:
1. Julia Shanahan [@juliashanahan](https://github.com/juliashanahan)
2. Ben Goodall [@bengoodalll](https://github.com/bengoodalll)
3. Kira Mennella [@kiramennella](https://github.com/kiramennella)
4. Peyton Strickland [@pes30522](https://github.com/pes30522)
5. Yulianna Pazymino [@yuliapazymino](https://github.com/yuliapazymino)

## Scenario Description:
As universities grow and student populations increase, the management of off-campus student housing becomes more complex. Our project focuses on developing a Student Housing Management System that streamlines the operations of student accommodations.

This system is designed to help housing administrators, students, and building managers efficiently manage various aspects of student housing, including rent payments, lease agreements, maintenance requests, utilities, and more. The database will provide a centralized platform to track apartment availability, process rent payments, and handle maintenance requests. It will also support additional functionalities such as parking permit management, and furniture inventory.

From a managerial perspective, this system will allow housing officials to gain valuable insights into occupancy rates, maintenance costs, and rent collection trends, while students will benefit from a more efficient process for managing their housing experience. The queries will offer data-driven insights for them to make informed decisions on areas such as budget allocation, facility maintenance, and room assignments.

Our solution will cater to university housing departments, student landlords, and off-campus property managers who wish to manage their student properties efficiently and provide an optimal living environment for students.

## Data Model:
![Model project 1](https://github.com/user-attachments/assets/14c07fe7-a483-45ea-bc96-11df706f58ea)


Our model represents a hypothetical housing corporation for off-campus student living for managing apartments, tenants, leases, maintenance requests, and associated utilities and staff in an apartment complex. 

The Student entity represents the student who has been or is currently a tenant of an apartment, and contains the personal information of the resident. Each student is associated with a lease. This is shown by a one-to-one relationship with the leases entity because a student is associated with only one lease, and each lease is specific to one student. The student entity also has a one-to-many relationship with the maintenance requests entity given that one student can make many maintenance requests, but each maintenance request is submitted by one student.

The leases entity, which contains the general leasing information, also has a relationship with two other entities. There is a one-to-many relationship with rent payments because one lease can have many rent payments, given that there are 12 monthly rent payments in a one-year lease, but each payment comes from one specific lease. Additionally, leases has another one-to-many relationship with apartment. Apartments can have different amounts of bedrooms with different amounts of students in each apartment. Each room is rented individually. Therefore, there can be many leases associated with one apartment, but each lease is specific to one apartment.

The apartment entity contains details regarding the size of the apartment, the cost, and whether it is available or not. Parking permits are available for all residents who wish to have a parking spot. The apartment entity and parking permits entity have a one-to-many relationship because if an apartment has multiple residents who each have one parking permit, one apartment can have many parking permits. On the other hand, one parking permit is associated with only one apartment. *CONTRACTS? There are 3 apartment buildings within this housing corporation. The apartments entity has a one-to-many relationship with the buildings entity because there are many apartments in one building, but an apartment is in one building.

## Data Dictionary:

![27EA16B1-4175-49C5-87A2-FEAA71CCCEF4](https://github.com/user-attachments/assets/b28eb736-4a08-412d-81dc-6e7c26f6bd20)
![image](https://github.com/user-attachments/assets/29085eb2-9f26-441a-974c-d9b3c2d6fa70)



## Queries: 
1. Query 1 lists all of the pending maintenance requests.

2. Query 2 lists the student name, building name, and apartment number of all residents with an overdue rent payment.

3. Query 3 lists the names and total rent cost for a year long lease for each resident.

4. Query 4 lists the room number, number of bedrooms, number of bathrooms, monthly rent, and the name of the building for all apartments still available for rent.

5. Query 5 lists the furniture inventory for each apartment by showing the apartment ID, the type of furniture, the quantity of each type, and the condition of the furniture. The results are ordered by the apartment ID and the type of furniture.

## Database Information:
