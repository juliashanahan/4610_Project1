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
As universities grow and student populations increase, the management of off-campus student housing becomes more complex. Our project focuses on developing a housing management database that showcases the operations of a student living apartment corporation.

This system is designed to display the workings between the housing administrators and the students, as well as how the  corporation manages various aspects of student housing, including rent payments, lease agreements, maintenance requests, utilities, and more. The database will provide a centralized platform to track apartment availability, process rent payments, and handle maintenance requests. It will also support additional functionalities such as parking permit management, and furniture inventory.

From a managerial perspective, this database will allow management to gain valuable insights into concepts such as occupancy rates, maintenance costs, and rent collection trends. The queries will offer data-driven insights for them to make informed decisions on areas such as budget allocation, facility maintenance, and room assignments.

## Data Model:
![Model project 1](https://github.com/user-attachments/assets/ff755ac2-1a48-482b-bb81-0c6fd8a15625)


Our model represents a hypothetical housing corporation for off-campus student living for managing apartments, tenants, leases, maintenance requests, and associated utilities and staff in an apartment complex. 

The Student entity represents a student who has been or is currently a tenant of an apartment, and contains personal information of the resident. Each student is associated with a lease. This is shown by a one-to-one relationship with the leases entity because a student is associated with only one lease, and each lease is specific to one student. The student entity also has a many-to-many relationship with the maintenance requests entity given that a student can make many maintenance requests, and one maintenance request can be for many students. For example, an apartment with more than one bedroom will have multiple students who each rent their room individually with their own lease. If an appliance in a common area such as the kitchen sink is broken and requires maintenance, the request is for all of the students.

The leases entity, which contains general leasing information, also has a relationship with two other entities. There is a one-to-many relationship with rent payments because one lease has many rent payments, given that there are 12 monthly payments in a one-year lease, but each payment comes from one specific lease. Additionally, leases a many-to-one relationship with apartment. Apartments can have different amounts of bedrooms with different amounts of students in each apartment. As mentioned before, each room is rented individually. Therefore, there can be many leases associated with one apartment, but each lease is specific to one apartment.

The apartment entity contains details regarding the size of the apartment, the cost, and whether it is available or not. Parking permits are available for all residents who wish to have a parking spot. The apartment entity and parking permits entity have a one-to-many relationship because an apartment may have multiple residents who each have one parking permit. Therefore, one apartment can have many parking permits. On the other hand, one parking permit is associated with only one apartment. There are 3 apartment buildings within this housing corporation. The apartments entity has a many-to-one relationship with the buildings entity because there are many apartments in one building, but an apartment is in one building. Every apartment also pays a monthly utility bill. This is represented by a one-to-many relationship with the utilities entity given that one apartment pays 12 monthly utility bills throughout a one-year lease, but each utility bill is associated with one apartment. Additionally, all apartments come fully furnished. This is represented by a furniture inventory entity that contains the information of all furniture that is provided by the housing corporation. The apartment entity has a one-to-many relationship with the furniture inventory entity because one apartment has many pieces of furniture, but one piece of furniture belongs to one apartment.

The building entity contains information about the name and address of the building, as well as the number of apartments it has. For each building, there is a specific set of maintenance workers who respond to requests for that building. This is represented by a one-to-many relationship between the building entity and maintenance staff entity because one building has many people on the maintenance staff, but a worker on the maintenance staff works for only one building.

## Data Dictionary:

![8C3EFA97-B9BF-4353-A5EC-B8AD540AB192](https://github.com/user-attachments/assets/8a0660fb-0e5e-4ba1-9cba-75b135c9ca7b)
![D61ABD14-8164-4FFE-B76E-78A171C99FD6](https://github.com/user-attachments/assets/0e0d164b-e772-4b76-aa2a-200a594a2ff0)
![BCEE8D66-9EB3-482A-873B-1D7F906EE471](https://github.com/user-attachments/assets/2cc90c65-48c9-49f9-b03a-9e69507fa3a9)
![FD1545A5-9B30-446F-A43D-9BE2A45D2073](https://github.com/user-attachments/assets/4d15e3b4-ca08-424c-a122-919c4d5daca1)
![3107130F-F24C-4E28-AF91-591FB99F3804](https://github.com/user-attachments/assets/9c4b3c68-7834-4ec3-a901-96b7c8823182)
![1DDB74ED-3B9B-422F-A637-B6CB47BB86F9](https://github.com/user-attachments/assets/cf64df0b-8aa5-4f48-b9d2-5baa8f5d71c0)
![C85A7164-2A41-4A17-96E1-D8AE92366D2D](https://github.com/user-attachments/assets/2f1831a5-f861-4a7e-9e26-ac964a0c2be3)
![35F6784E-48D5-49DF-90D3-99287F9442F6](https://github.com/user-attachments/assets/377a8886-97c2-4dda-8360-831d21b5e87f)
![46F9AC6D-AFE2-435E-81DF-4CDF8F632E27](https://github.com/user-attachments/assets/6349bc59-859f-449b-982c-fd48df7b1169)
![FEC4D783-1FFB-46F3-9361-726F3309D0C8](https://github.com/user-attachments/assets/0e39b21f-9295-4969-bd40-b729a489f7bf)
![8D73126B-E1B8-4162-BFA2-A5A9D2396B2B](https://github.com/user-attachments/assets/561a6b59-d010-4f5d-bc18-c278ddbdb355)

## Queries:
<img width="768" alt="Screenshot 2024-10-13 at 7 05 40 PM" src="https://github.com/user-attachments/assets/f4742c93-756c-4d99-adc5-1994ba881e8f">

Query 1 lists all of the pending maintenance requests.

<img width="212" alt="Screenshot 2024-10-13 at 3 29 07 PM" src="https://github.com/user-attachments/assets/879f2b80-eae0-4f15-b88a-905fc3869320">
<img width="527" alt="Screenshot 2024-10-13 at 3 29 41 PM" src="https://github.com/user-attachments/assets/09e20f87-0155-4be2-8b8b-3ee9b0a441b1">

Query 1 is beneficial for management because awareness of the pending maintenace requests allows them to monitor the workload of their maintenance staff, as well as confirm that requests are taken care of in a timely manner. By gaining a better understanding of their staff's workload, management can ensure they are not being underutilized or overutilized, leading to more efficient scheduling. More efficieny scheduling will also assist in confirming that requests are taken care of promptly, which is crucial for resident satisfaction. Furthermore, management can use this information to identify trends and recurring issues, allowing for better strategic planning for infrastructure and appliance updates.

--

Query 2 lists the student name, building name, and apartment number of all residents with an overdue rent payment.

<img width="618" alt="Screenshot 2024-10-13 at 3 30 33 PM" src="https://github.com/user-attachments/assets/19e20287-5aa6-4c89-83c9-60edff62fd2a">
<img width="960" alt="Screenshot 2024-10-13 at 3 30 47 PM" src="https://github.com/user-attachments/assets/76a24708-63c3-4be6-8167-b024186011aa">

Query 2 is beneficial for management because it can help maintain a positive relationship with the resident. By prioritizing communication with the residents who have overdue payments, management can address the issue quickly and get it resolved before it becomes a larger problem. This query also allows management to enforce any policies in the lease for overdue payments, such as late fees.

--

Query 3 lists the names and total rent cost for a year long lease for each resident.

<img width="508" alt="Screenshot 2024-10-13 at 3 54 47 PM" src="https://github.com/user-attachments/assets/6e696e69-3d9f-4d9c-9875-d68cc6eaf8e0">
<img width="217" alt="Screenshot 2024-10-13 at 3 56 07 PM" src="https://github.com/user-attachments/assets/ab8dbaa7-a881-41eb-97b1-f5e19e58d4ca">

Query 3 is beneficial for management because by knowing the total rent of each resident, it allows them to predict their annual revenue. By knowing the amount of revenue they can expect, management can use this information to evaluate their current pricing, and assess if the rent should be increased or decreased in the future.

--

Query 4 lists the room number, number of bedrooms, number of bathrooms, monthly rent, and the name of the building for all apartments still available for rent.

<img width="771" alt="Screenshot 2024-10-13 at 3 57 04 PM" src="https://github.com/user-attachments/assets/39c63930-fdd4-49c2-9753-681ac63ab5f7">
<img width="507" alt="Screenshot 2024-10-13 at 3 57 21 PM" src="https://github.com/user-attachments/assets/a1c8b021-1c6e-449a-a7c4-ea4ef572ed5c">

Query 4 is beneficial to management because it will allow them to see which apartments and the details of the apartments that are available to any interested tenants. This information could affect their marketing efforts. For example, they may focus on promoting larger apartments with more bedrooms/bathrooms if these layouts are the ones that remain available. Additionally, they may be able to identify a trend in the unrented rooms. If there is a specific building that has significantly more vacancies, this may indicate a larger issue with things such as the location, the amenities, etc.

--

Query 5 lists all the active leases for an apartment based on students first name, last name, and start date. 

<img width="524" alt="Screenshot 2024-10-13 at 7 28 44 PM" src="https://github.com/user-attachments/assets/b36758a3-26f3-457c-a08f-198546081786">
<img width="215" alt="Screenshot 2024-10-13 at 7 27 42 PM" src="https://github.com/user-attachments/assets/f0c6a504-1720-441c-a9b2-9bca4e35a7c5">

Query 5 is beneficial to management to know which leases are active to make sure they can financially plan for their budgets based on how much rent money they expect to recieve from the students that are actively paying their leases. For risk management purposes, this can help management understand how much renters insurance they need for the complex. 

--

Query 6 lists the furniture inventory for each apartment by showing the apartment ID, the type of furniture, the quantity of each type, and the condition of the furniture. The results are ordered by the apartment ID and the type of furniture.

<img width="707" alt="Screenshot 2024-10-13 at 3 58 13 PM" src="https://github.com/user-attachments/assets/5be24e56-0bc3-448c-a8f2-24987c183958">
<img width="378" alt="Screenshot 2024-10-13 at 3 58 32 PM" src="https://github.com/user-attachments/assets/7f593c06-dc81-4763-b71e-ea3571f84321">

Query 6 is beneficial to management to know what furniture is in each apartment and to know the condition of the pieces. It is important for management to understand which pieces of furniture they might need to update or buy replacements of. 

--

Query 7 lists the average cost of utilities per apartment that are over $100 per month based on apartment room number and number of bedrooms.

<img width="798" alt="Screenshot 2024-10-13 at 7 56 56 PM" src="https://github.com/user-attachments/assets/330a5cfb-d220-4418-a1a1-a1caa1f74a49">
<img width="369" alt="Screenshot 2024-10-13 at 7 57 50 PM" src="https://github.com/user-attachments/assets/89ef2236-fdb4-4fa9-982c-58ff53f1e9a6">


Query 7 is beneficial to management as they can use this to monitor the average cost of utilities per apartment and if there is an apartment where their average utilities is way higher than other apartments, that could be a sign of a leak or damage of electrical wires. Management could know which apartment to go and make sure that everything is working properly for the student tenets. 


--

Query 8 lists the Student's information who are marked as their rent is paid.

<img width="724" alt="Screenshot 2024-10-13 at 3 59 15 PM" src="https://github.com/user-attachments/assets/6a34d2b5-0f9a-4615-9637-e37a6d2469e8">
<img width="643" alt="Screenshot 2024-10-13 at 3 59 31 PM" src="https://github.com/user-attachments/assets/2c70a039-bbe1-411d-ba8f-93daa0dcf88c">

Query 8 is beneficial because it gives management an easy list of everyone who has paid their rent to make sure everyone is up to date.
--

Query 9 lists all the apartments with two bedrooms or more.

<img width="869" alt="Screenshot 2024-10-13 at 3 59 48 PM" src="https://github.com/user-attachments/assets/624b5e51-d06d-4078-a0de-1b1e69db06cb">
<img width="504" alt="Screenshot 2024-10-13 at 4 00 03 PM" src="https://github.com/user-attachments/assets/c3114f1d-2a7b-457d-a88f-fe6d8fa803fa">

Query 9 benefits management as it quickly lists all of the apartments with two bedrooms or more. When they are signing new residents who want a larger apartment, they can pull up the entire list so they can give their potential residents their options.
--

Query 10 lists the 5 apartments with the lowest rent.

<img width="798" alt="Screenshot 2024-10-13 at 4 00 13 PM" src="https://github.com/user-attachments/assets/69180095-5b3f-4cb3-a873-6e59c0c72412">
<img width="376" alt="Screenshot 2024-10-13 at 4 00 24 PM" src="https://github.com/user-attachments/assets/cec86e60-cb93-45b7-bff0-2b6f9ea9925b">

Query 10 benefits management because they can give potential residents who may be on a tighter budget their apartment options.

## Database Information:
