module sm_Mealy(
input clk,x,
output [1:0] Sreg,
output [1:0] Snext,
output z);
  
reg [1:0] Sreg;
reg z;
reg [1:0] Snext;
parameter [1:0] A =2'b00, B=2'b01, C=2'b10, D=2'b11; // define states

always @(posedge clk) // state memory
Sreg<=Snext;
  
always @(x,Sreg) // next-state logic
begin
case(Sreg)
A: if(x==0) Snext = A; else Snext = B; 
B: if(x==0) Snext = B; else Snext = C;
C: if(x==0) Snext = C; else Snext = D;
D: if(x==0) Snext = D; else Snext = A;
default Snext = A;
endcase
end
  
  always @ (x,Sreg) //output logic - Notice it's also dependent on input
case(Sreg)
A: if(x==0) z=0; else z=0;
B: if(x==0) z=0; else z=0;
C: if(x==0) z=0; else z=0;
D: if(x==0) z=0; else z=1;
default z=0;
endcase
  
endmodule
