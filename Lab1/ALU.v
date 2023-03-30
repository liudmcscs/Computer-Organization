//Subject:     CO project 1 - ALU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module ALU(
    src1_i,
	src2_i,
	ctrl_i,
	result_o,
	zero_o,
	src3_i
	);
     
//I/O ports
input  [32-1:0]   src1_i;
input  [32-1:0] 	 src2_i;
input  [32-1:0] 	 src3_i;
input  [4-1:0]   ctrl_i;

output  reg signed [32-1:0] 	 result_o;
output    reg     zero_o;
reg signed [32-1:0]src4;
//Internal signals
/*reg    [32-1:0]  result_o;
wire             zero_o;*/
/*always@(*)
begin
	
end*/
always@(*)
begin
	if(ctrl_i==6)
	begin
	zero_o=(result_o==0);
	end
	else if(ctrl_i==10)
	begin
	zero_o=(result_o!=0);
	end
end
//assign zero_o=(result_o==0);
always@(ctrl_i,src1_i,src2_i)
begin
	src4[31:0]=src2_i[31:0];
 case(ctrl_i)
	0:result_o<=src1_i&src2_i;
	1:result_o<=src1_i|src2_i;
	2:result_o<=src1_i+src2_i;
	6:result_o<=src1_i-src2_i;
	7:result_o<=src1_i<src2_i?1:0;
	8:result_o=src4>>>src3_i;
	9:result_o<=src2_i<<16;//{{src2_i[7:0]},{24{1'b0}}};
	10:result_o<=src1_i-src2_i;
	11:result_o=src4>>>src1_i;
	12:result_o<=~(src1_i|src2_i);
	default :result_o<=0;
 endcase
end
//Parameter

//Main function

endmodule





                    
                    