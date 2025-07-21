module tfc(clk, rst, mainRoad, mainRoad2, sideTurn, mainRoadTurn);  
input clk,rst;             //input 
output reg [2:0]mainRoad;  //output 
output reg [2:0]mainRoad2; 
output reg [2:0]sideTurn; 
output reg [2:0]mainRoadTurn; 
     
    
parameter  S1=3'b001, S2=3'b010, S3 =3'b011, S4=3'b100, S5=3'b101,S6=3'b110; //declaring 
states 
reg [3:0]count=3'b000; 
reg[2:0] ps; 
parameter  sec7=3'b111,sec5=3'b101,sec2=3'b010,sec3=3'b011;  //Delays 
 
 
always@(posedge clk or posedge rst) //Assigning the flow of delay 
begin  
if(rst==1)             //If reset is provide 
begin 
ps<=S1; 
count<=0; 
end 
 
else 
case(ps)                    //Appling case of each state     
S1: if(count<sec7)          //State 1  
begin 
ps<=S1; 
count<=count+1; 
 
 
end                         //Go to 2nd State 
else 
begin 
ps<=S2; 
count<=0; 
end 
 
 
S2: if(count<sec2)          //2nd State 
begin 
ps<=S2; 
count<=count+1; 
end 
else                       //Go to 3rd state 
begin               
ps<=S3; 
count<=0; 
end 
        
S3: if(count<sec5)        //3rd State 
begin 
ps<=S3; 
count<=count+1; 
end 
else                   //Go to 4th State 
begin 
ps<=S4; 
count<=0; 
end 
  
 
S4:if(count<sec2)           //4th State 
begin 
ps<=S4; 
count<=count+1; 
end 
else                        //Got to 5th state 
begin 
ps<=S5; 
count<=0; 
end 
 
S5:if(count<sec3)            //5th state 
begin 
ps<=S5; 
count<=count+1; 
end 
else                       //Go to 6th State 
begin 
ps<=S6; 
count<=0; 
end 
 
S6:if(count<sec2)           //6th State 
begin 
ps<=S6; 
count<=count+1; 
end     
else                      //Again go to 1st State (loop continues) 
begin 
ps<=S1; 

 
count<=0; 
end 
 
default: ps<=S1;      //Default case will go to State 1 
endcase 
end  
 
  
//Moore machine depends on present state 
always@(ps)     
begin 
case(ps) 
//Assigning outputs to every State 
                      
S1:                             //State 1 
begin 
  mainRoad<=3'b001;             //Green color 
  mainRoad2<=3'b001;            //Green color 
  mainRoadTurn<=3'b100;      //Red color 
  sideTurn<=3'b100;             //Red color 
end 
 
S2:                             //State 2 
begin 
  mainRoad<=3'b001;             //Green color 
  mainRoad2<=3'b010; //Yellow color 
  mainRoadTurn<=3'b100;       //Red color 
  sideTurn<=3'b100;          //Red color 
end 
 
 
S3:                                 //State 3 
begin 
  mainRoad<=3'b001;            //Red color 
  mainRoad2<=3'b100;         //Red color 
  mainRoadTurn<=3'b001;             //Green color 
  sideTurn<=3'b100;                   //Red color 
end 
 
S4:                             //State 4 
begin 
 mainRoad<=3'b010;          //Yellow color 
 mainRoad2<=3'b100;         //Red color 
 mainRoadTurn<=3'b010;   //Yellow color 
 sideTurn<=3'b100;         //Red color 
end 
 
S5:                             //State 5 
begin 
 mainRoad<=3'b100;         //Red color 
 mainRoad2<=3'b100;         //Red color 
 mainRoadTurn<=3'b100;   //Red color 
 sideTurn<=3'b001;              //Green color 
end 
 
S6:                             //State 6 
begin 
 mainRoad<=3'b100;         //Red color 
 mainRoad2<=3'b100;         //Red color 
 mainRoadTurn<=3'b100;         //Red color 
 sideTurn<=3'b010;  //Yellow color 
 
end 
 
default:                        //Default case 
begin 
 mainRoad<=3'b000;             //None of the LED will blink in all these cases 
 mainRoad2<=3'b000; 
 mainRoadTurn<=3'b000; 
 sideTurn<=3'b000; 
end 
endcase                
 
end                       
endmodule