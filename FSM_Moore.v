module sm(
input clk,
input en,
output z,
output Sreg
);
  
reg z;
reg [1:0] Sreg;
reg [1:0] Snext; // state register (current state) and next state
parameter [1:0] A=2'b00, //Define states
B=2'b01,
C=2'b10,
D=2'b11;
always @(posedge clk) // create state memory
Sreg<=Snext;
  
always @ (en or Sreg) // Next-state logic
begin
case(Sreg)
A: if(en==0) Snext=A;
else Snext=B;
B: if(en==0) Snext=B;
else Snext=C;
C: if(en==0) Snext=C;
else Snext=D;
D: if(en==0) Snext=D;
else Snext=A;
default: Snext = A;
endcase
end
  
always @ (Sreg) // Output logic
case (Sreg)
A,B,C: z=0;
D: z=1;
default: z=0;
endcase
  
endmodule
