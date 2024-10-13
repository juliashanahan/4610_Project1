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
![Model project 1](https://github.com/user-attachments/assets/ff755ac2-1a48-482b-bb81-0c6fd8a15625)


Our model represents a hypothetical housing corporation for off-campus student living for managing apartments, tenants, leases, maintenance requests, and associated utilities and staff in an apartment complex. 

The Student entity represents a student who has been or is currently a tenant of an apartment, and contains personal information of the resident. Each student is associated with a lease. This is shown by a one-to-one relationship with the leases entity because a student is associated with only one lease, and each lease is specific to one student. The student entity also has a one-to-many relationship with the maintenance requests entity given that one student can make many maintenance requests, but each maintenance request is submitted by one student.

The leases entity, which contains general leasing information, also has a relationship with two other entities. There is a one-to-many relationship with rent payments because one lease has many rent payments, given that there are 12 monthly payments in a one-year lease, but each payment comes from one specific lease. Additionally, leases has another one-to-many relationship with apartment. Apartments can have different amounts of bedrooms with different amounts of students in each apartment. Each room is rented individually. Therefore, there can be many leases associated with one apartment, but each lease is specific to one apartment.

The apartment entity contains details regarding the size of the apartment, the cost, and whether it is available or not. Parking permits are available for all residents who wish to have a parking spot. The apartment entity and parking permits entity have a one-to-many relationship because an apartment may have multiple residents who each have one parking permit, one apartment can have many parking permits. On the other hand, one parking permit is associated with only one apartment. *CONTRACTS/ROOMATES? There are 3 apartment buildings within this housing corporation. The apartments entity has a one-to-many relationship with the buildings entity because there are many apartments in one building, but an apartment is in one building. Every apartment also pays a monthly utility bill. This is represented by a one-to-many relationship with the Utilities entity given that one apartment pays 12 monthly utility bills throughout a one-year lease, but each utility bill is associated with one apartment. Additionally, all apartments come fully furnished. This is represented by a furniture inventory entity that contains the information of all furniture that is provided by the housing corporation. The apartment entity has a one-to-many relationship with the furniture inventory entity because one apartment has many pieces of furniture, but one piece of furniture belongs to one apartment. *MAINTENANCE REQUESTS?

The building entity contains information about the name and address of the building, as well as the number of apartments it has. For each building, there is a specific set of maintenance workers who respond to requests for that building. There is a one-to-many relationship between the building entity and maintenance staff entity because one building has many people on the maintenance staff, but a worker on the maintenance staff works for only one building.

## Data Dictionary:

![27EA16B1-4175-49C5-87A2-FEAA71CCCEF4](https://github.com/user-attachments/assets/b28eb736-4a08-412d-81dc-6e7c26f6bd20)
![63A16ABC-B9FE-4C68-9682-0FCCB2401AC8](https://github.com/user-attachments/assets/30604c93-b503-4aea-a6a4-6e10e84dffb7)
![47F452A6-54EC-4C56-9256-CAE55F9D2CD5](https://github.com/user-attachments/assets/43d2a1c2-45ca-4411-92ed-7e307b15c1dd)
![A91200CD-1E28-48AB-98FE-4F22CF7E2B8A](https://github.com/user-attachments/assets/080e083a-653c-4b6e-8ad3-f592126ed835)
![DEF43C41-06DB-4644-AB44-54ACED4E2FBF](https://github.com/user-attachments/assets/cc27765d-9b6c-467b-8ab8-02dbe0a9e307)
![356D44E6-8319-4D68-B6BE-9C964FE614D7](https://github.com/user-attachments/assets/8cb1af20-b358-422d-ab5e-2c66daf2a7a4)
![6878C40D-9F67-41A9-89BF-C60626F2ACAE](https://github.com/user-attachments/assets/912cd70d-9cf1-49c6-a984-79ef5b3a0ee6)
![94B09E6A-5B7B-44C5-8D21-50B73B30ADBD](https://github.com/user-attachments/assets/2b18ffd6-3f42-4a89-be35-27d768b577ca)
![86290B71-EBA8-47F3-8FB2-AA8348CB071A](https://github.com/user-attachments/assets/524df752-3be0-43ec-97c5-0967f37f10bd)
![64AB2DD6-E6A4-4D57-A81B-10ABBFA0F254](https://github.com/user-attachments/assets/84fac451-92f2-4058-87d3-38fbdfa5a59e)
![FFDE0BFD-D6AF-4D18-BA3F-FD0F0B42C64D](https://github.com/user-attachments/assets/e07e77fc-f9c9-45f0-8a55-7c6e79ad4224)
![148497EA-1B97-4C8B-8901-8DFDA9B5911B](https://github.com/user-attachments/assets/2b8e0c4a-402f-4ffe-8b78-22d95b1a295f)
![7C56D558-E389-4618-9BEA-A5B035FB0629](https://github.com/user-attachments/assets/4cfe44cb-0cf0-4150-8ca6-80e7972d350f)


## Queries:
Query 1 lists all of the pending maintenance requests.

<img width="212" alt="Screenshot 2024-10-13 at 3 29 07 PM" src="https://github.com/user-attachments/assets/879f2b80-eae0-4f15-b88a-905fc3869320">
<img width="527" alt="Screenshot 2024-10-13 at 3 29 41 PM" src="https://github.com/user-attachments/assets/09e20f87-0155-4be2-8b8b-3ee9b0a441b1">


Query 2 lists the student name, building name, and apartment number of all residents with an overdue rent payment.

<img width="618" alt="Screenshot 2024-10-13 at 3 30 33 PM" src="https://github.com/user-attachments/assets/19e20287-5aa6-4c89-83c9-60edff62fd2a">
<img width="960" alt="Screenshot 2024-10-13 at 3 30 47 PM" src="https://github.com/user-attachments/assets/76a24708-63c3-4be6-8167-b024186011aa">


Query 3 lists the names and total rent cost for a year long lease for each resident.

<img width="508" alt="Screenshot 2024-10-13 at 3 54 47 PM" src="https://github.com/user-attachments/assets/6e696e69-3d9f-4d9c-9875-d68cc6eaf8e0">
<img width="217" alt="Screenshot 2024-10-13 at 3 56 07 PM" src="https://github.com/user-attachments/assets/ab8dbaa7-a881-41eb-97b1-f5e19e58d4ca">


Query 4 lists the room number, number of bedrooms, number of bathrooms, monthly rent, and the name of the building for all apartments still available for rent.

<img width="525" alt="Screenshot 2024-10-13 at 3 56 25 PM" src="https://github.com/user-attachments/assets/f2c75437-d51f-4797-ba82-0435fef1656a">
<img width="221" alt="Screenshot 2024-10-13 at 3 56 46 PM" src="https://github.com/user-attachments/assets/548dd11d-f8ab-4bda-9632-9c1e3bb22206">


Query 5 lists the furniture inventory for each apartment by showing the apartment ID, the type of furniture, the quantity of each type, and the condition of the furniture. The results are ordered by the apartment ID and the type of furniture.

<img width="771" alt="Screenshot 2024-10-13 at 3 57 04 PM" src="https://github.com/user-attachments/assets/39c63930-fdd4-49c2-9753-681ac63ab5f7">
<img width="507" alt="Screenshot 2024-10-13 at 3 57 21 PM" src="https://github.com/user-attachments/assets/a1c8b021-1c6e-449a-a7c4-ea4ef572ed5c">

Query 6

<img width="707" alt="Screenshot 2024-10-13 at 3 58 13 PM" src="https://github.com/user-attachments/assets/5be24e56-0bc3-448c-a8f2-24987c183958">
<img width="378" alt="Screenshot 2024-10-13 at 3 58 32 PM" src="https://github.com/user-attachments/assets/7f593c06-dc81-4763-b71e-ea3571f84321">


Query 7

Needs to be fixed has errors


Query 8

<img width="724" alt="Screenshot 2024-10-13 at 3 59 15 PM" src="https://github.com/user-attachments/assets/6a34d2b5-0f9a-4615-9637-e37a6d2469e8">
<img width="643" alt="Screenshot 2024-10-13 at 3 59 31 PM" src="https://github.com/user-attachments/assets/2c70a039-bbe1-411d-ba8f-93daa0dcf88c">


Query 9

<img width="869" alt="Screenshot 2024-10-13 at 3 59 48 PM" src="https://github.com/user-attachments/assets/624b5e51-d06d-4078-a0de-1b1e69db06cb">
<img width="504" alt="Screenshot 2024-10-13 at 4 00 03 PM" src="https://github.com/user-attachments/assets/c3114f1d-2a7b-457d-a88f-fe6d8fa803fa">


Query 10

<img width="798" alt="Screenshot 2024-10-13 at 4 00 13 PM" src="https://github.com/user-attachments/assets/69180095-5b3f-4cb3-a873-6e59c0c72412">
<img width="376" alt="Screenshot 2024-10-13 at 4 00 24 PM" src="https://github.com/user-attachments/assets/cec86e60-cb93-45b7-bff0-2b6f9ea9925b">


## Database Information:
