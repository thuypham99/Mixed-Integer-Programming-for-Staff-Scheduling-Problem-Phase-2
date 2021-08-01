/*********************************************
 * OPL 12.9.0.0 Model
 * Author: Windows 10
 * Creation Date: Apr 7, 2021 at 3:35:57 PM
 *********************************************/
//TEST
//int numEmShiftArea=17;
//int numDay=7;
//range Off;
//range Fiday=1..17;
//range Thday;
//range Twday;
//range Day=1..numDay;
//range EmShiftArea=1..numEmShiftArea;
//tuple Schedule{
//	int Off;
//	int Day;
//}
//setof (Schedule) OffRegister=...;
//int D[Day]=[12,12,12,12,12,12,12];
int numEmShiftArea=...;
int numDay=...;
tuple Schedule{
	int Off;
	int Day;
}
range EmShiftArea=1..numEmShiftArea;

//PICKING DAY
range Off=1..17;
range Fiday=18..26;
range Thday=27..32;
{int} Twday={33};

//PICKING NIGHT
//range Off=1..18;
//range Fiday=19..26;
//range Thday=27..30;
//range Twday=31..35;

//PACKING DAY
//range Off=1..19;
//range Fiday=20..23;
//range Thday=24..27;
//range Twday=28..31;

//PACKING NIGHT
//range Off=1..16;
//range Fiday=17..25;
//range Thday=26..30;
//range Twday=31..33;

//HANDOVER DAY
//range Off=1..15;
//range Fiday=16..21;
//range Thday=22..26;
//{int} Twday={27};

//HANDOVER NIGHT
//range Off=1..15;
//range Fiday=16..22;
//range Thday=23..24;
//range Twday=25..29;

range Day=1..numDay;
setof (Schedule) OffRegister=...;
int D[Day]=...;
dvar boolean X[EmShiftArea][Day];//whether each employee works on day d or not
dvar boolean Y[EmShiftArea][Day];//whether Two-day-contract works on day d or not
dvar boolean K[EmShiftArea][Day];//whether Three-day-contract works on day d or not
dvar boolean Z[EmShiftArea][Day];//whether Five-day-contract works on day d or not
float temp;
execute{
var before = new Date();
temp = before.getTime();
}
execute SETTING{
	cplex.epgap=0.001;
	cplex.tilim=6000;
}
maximize sum(<e,d> in OffRegister)(1-X[e][d])+sum(e in Twday,d in 1..6)Y[e][d]+sum(e in Thday,d in 1..5)K[e][d]+sum(e in Fiday,d in 1..2)Z[e][d];
subject to
{
//Satisfy Official dayoff
forall(e in Off){
	sum(d in Day)X[e][d]==6;
}
forall(d in Day){
	sum(e in EmShiftArea)X[e][d]>=D[d];
}
//Satisfy Two-day-contract consecutive
forall(e in Twday){
	sum(d in Day)X[e][d]==2;
}
forall(e in Twday,d in 1..6){
	Y[e][d]>=X[e][d]+X[e][d+1]-1;
	Y[e][d]<=X[e][d];
	Y[e][d]<=X[e][d+1];
}
//Satisfy Three-day-contract consecutive
forall(e in Thday){
	sum(d in Day)X[e][d]==3;
}
forall(e in Thday,d in 1..5){
	K[e][d]>=X[e][d]+X[e][d+1]+X[e][d+2]-2;
	K[e][d]<=X[e][d];
	K[e][d]<=X[e][d+1];
	K[e][d]<=X[e][d+2];
}
//Satisfy Five-day-contract consecutive
forall(e in Fiday){
	sum(d in Day)X[e][d]==5;
}
forall(e in Fiday,d in 1..2){
	Z[e][d]>=X[e][d]+X[e][d+1]+X[e][d+2]+X[e][d+3]+X[e][d+4]-4;
	Z[e][d]<=X[e][d];
	Z[e][d]<=X[e][d+1];
	Z[e][d]<=X[e][d+2];
	Z[e][d]<=X[e][d+3];
	Z[e][d]<=X[e][d+4];
}
}
execute{
var after = new Date();
writeln("solving time ~= ",after.getTime()-temp);
}