
always @ (x,Sreg) //output logic
case(Sreg)
A: if(x==0) z=0; else z=0;
B: if(x==0) z=0; else z=0;
C: if(x==0) z=0; else z=0;
D: if(x==0) z=0; else z=1;
default z=0;
endcase
endmodule
