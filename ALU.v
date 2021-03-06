module ALU(enable,control,operand1,operand2,in_carry,out_data,zero_flag,overflow_flag,negative_flag);
  input [31:0] operand1,operand2;
  input in_carry,enable;
  input [3:0] control;
  output [31:0] out_data;
  output zero_flag,overflow_flag,negative_flag;
  
  wire [31:0] operand1,operand2;
  reg [32:0] out_data_with_33bits;
 // wire enable;
  reg [31:0] out_data;
  reg overflow_flag,negative_flag;
  wire zero_flag;
  
  assign zero_flag=(|out_data_with_33bits)?0:1;
  
  always@(enable)
  begin
  //  zero_flag=(|out_data_with_33bits)?0:1;
    case (control)
      4'b0000 :out_data=out_data;
      4'd4    :begin              //Addition without carry
               out_data_with_33bits = operand1 + operand2;
               overflow_flag=out_data_with_33bits[32];
               out_data=out_data_with_33bits[31:0];
               end
      4'b0001 :begin              //Subtraction without initial borrow
               out_data_with_33bits=operand1 - operand2;
               negative_flag=out_data_with_33bits[32];
               out_data=out_data_with_33bits[31:0];
               end
      4'b0010 :begin              //Bitwise and
               out_data=operand1 & operand2;
               end
      4'b0011 :begin              //Bitwise OR
               out_data=operand1 | operand2;
               end
      4'b0111 :begin              //Bitwise XOR
               out_data=operand1 ^ operand2;
               end
      4'b0101 :begin
               out_data_with_33bits=operand1 + operand2 + in_carry;
               out_data=out_data_with_33bits[31:0];
               overflow_flag=out_data_with_33bits[32];
               end
               
    endcase
  end
  
endmodule
               
      
  
