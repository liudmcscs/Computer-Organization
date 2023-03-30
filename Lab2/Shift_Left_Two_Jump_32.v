//Subject:      CO project 2 - Shift_Left_Two_32
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Shift_Left_Two_Jump_32(
    data_i,
	data_pc,
    data_o
    );

//I/O ports                    
input [25:0] data_i;
input [3:0] data_pc;
output [32-1:0] data_o;

//shift left 2
reg[31:0] data_o;
reg[27:0] temp;
always@(data_i)
begin
	temp=data_i;
	data_o[31:28]<=data_pc;
	data_o[27:0]=(temp<<2);
end
endmodule
