- 👋 Hi, I’m Thuy Pham Tran Minh
- 👀 This is the thesis topic for the Degree of Bachelor of Engineering in Logistics and Supply Chain Management
- 📫 How to reach me: phamtranminhthuy@gmail.com

✨ METAHEURISTIC FOR STAFF SCHEDULING PROBLEM IN ORDER FULFILLMENT: A CASE STUDY OF LAZADA ELOGISTICS VIETNAM ✨

- Objectives of Study: 

The solution of the scheduling model in this study will help not only Lazada E-Logistics Express but also other e-commerce platforms which have its order fulfillment service launch its outbound sales plan. When a vast majority of customer orders occurs, the outbound operation needs to work in full capacity. The rostering team needs some support tools to assign both temporary and official staff effectively in each area. Therefore, utilizing this rostering implementation in sales campaigns will help a company make the right decision at the right time to hire employees with affordable costs whilst satisfying worker preferences. These tools also can help managers reduce a bottleneck caused by improper assignment. Simultaneously, building a transparent contract including legal regulations, workplace policies, penalty, fixed labor cost, bonus cost, and other conditions not only ensure the rights and duties of employees but also help a warehouse avoid a sudden withdrawal.

- Scope:

The use of scheduling methods is crucial in building an effective real-world staff scheduling problem. This paper is aimed at solving a problem domain from order fulfillment industry, which plays a key vital to satisfy such a sudden increase of customer satisfactions, especially in Covid-19 pandemic by and large. There are two main objective functions including minimize the hiring cost and maximize the aspirations of workers. 

In this research, Requirement-Based Staff Scheduling Algorithm (RSSA) is introduced to compare with a two-phase Mixed Integer Programming and Genetic Algorithm with two-dimensional array chromosome structure. Mathematical model of phase 1 is implemented to give a fesible solution for the first target. Besides, experimental results highlight that RSSA and mathematical model of phase 2 could be applied effectively in current scale for the second goal. Especially, this novel algorithm tends to save more time whilst the Mixed Integer Programming model seems to satisfy high percentage of staff preferences when a demand forecasting is fluctuated. On the other hand, Genetic Algorithm is recommended in case of a scale of data is immense. 

------------- MODELLING FOR MATHEMATICAL MODEL PHASE 2 -------------
- Sets and Indices	

ⅇ: Index of employees ⅇ=1…E (e ∈ Off/ e ∈Twday/ e ∈ Thday/ e ∈ Fiday)

d: Index of days d=1…D

Schedule: Tuple ={(e,d):e∈Off is requested on day-off d∈days}

OffRegister:	Set of Schedule

- Parameters	

D[d]:	The number of employees required for day d

- Decision Variables	

X[e][d]:	Binary variable; X[e][d]=1 if employee ⅇ is assigned to day d, otherwise X[e][d]=0

Y[e][d]: 	Binary variable; Y[e][d]=1 if two-day-contract employee ⅇ is assigned to day d, otherwise Y[e][d]=0

K[e][d]:	Binary variable; K[e][d]=1 if three-day-contract employee ⅇ is assigned to day d, otherwise K[e][d]=0

Z[e][d]:	Binary variable; Z[e][d]=1 if five-day-contract employee ⅇ is assigned to day d, otherwise Z[e][d]=0

- Explain:

The objective function is aimed at maximizing the preference for day-off of official manpower and the consecutive working days for temporary employees in order to be convenient and easier for them to schedule their time.  Constraint (15) denotes the day-off interests of official employees. Constraint (16) satisfies the demand of manpower per day. Constraint (17), (21), and (26) assign exactly the required working days related to their contracts. For example, an employee having a two-day contract must work precisely two days. Constraint (18), (19), and (20) are applied “And” condition Y[e][d]=X[e][d]∩(X[e][d]+1) to desire two consecutive days for two-day-contract staff. Accordingly, constraints (22), (23), (24) and (25) are applied “And” condition K[e][d]=X[e][d]∩(X[e][d]+1)∩(X[e][d]+2) to desire three consecutive days for three-day-contract staff. Similarly, constraints from (27) to (32) are applied “And” condition Z[e][d]=X[e][d]∩(X[e][d]+1)∩(X[e][d]+2)∩(X[e][d]+3)∩(X[e][d]+4) to desire five consecutive days for five-day-contract staff.
