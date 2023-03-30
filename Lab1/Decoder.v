//Subject:     CO project 1 - Decoder
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Decoder(
    instr_op_i,
	RegWrite_o,
	ALU_op_o,
	ALUSrc_o,
	RegDst_o,
	Branch_o,
	ALU_extend_o
	);
     
//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;
output [3-1:0] ALU_op_o;
output         ALUSrc_o;
output         RegDst_o;
output         Branch_o;
output		   ALU_extend_o;
 
//Internal Signals
reg    [3-1:0] ALU_op_o;
reg            ALUSrc_o;
reg            RegWrite_o;
reg            RegDst_o;
reg            Branch_o;
reg			   ALU_extend_o;
//Parameter
always@(instr_op_i)
begin
	ALU_op_o<=0;
	ALUSrc_o<=0;
	RegWrite_o<=0;
	RegDst_o<=0;
	Branch_o<=0;
	ALU_extend_o<=0;
	case (instr_op_i)
	6'b000000:
	begin
		ALU_op_o  <=2;
		ALUSrc_o  <=0;
		RegWrite_o<=1;
	    RegDst_o  <=1;
	    Branch_o  <=0;
		ALU_extend_o<=1;
	end
	6'b001000:
	begin
		ALU_op_o  <=7;
		ALUSrc_o  <=1;
		RegWrite_o<=1;
	    RegDst_o  <=0;
	    Branch_o  <=0;
		ALU_extend_o<=0;
	end
		6'b001011:
	begin
		ALU_op_o  <=3;
		ALUSrc_o  <=1;
		RegWrite_o<=1;
	    RegDst_o  <=0;
	    Branch_o  <=0;
		ALU_extend_o<=0;
	end
		6'b000100:
	begin
		ALU_op_o  <=1;
		ALUSrc_o  <=0;
		RegWrite_o<=0;
	    RegDst_o  <=/*1'bx*/0;
	    Branch_o  <=1;
		ALU_extend_o<=0;
	end
		6'b001111:
	begin
		ALU_op_o  <=6;
		ALUSrc_o  <=1;
		RegWrite_o<=1;
	    RegDst_o  <=0;
	    Branch_o  <=0;
		ALU_extend_o<=0;
	end
		6'b001101:
	begin
		ALU_op_o  <=5;
		ALUSrc_o  <=1;
		RegWrite_o<=1;
	    RegDst_o  <=0;
	    Branch_o  <=0;
		ALU_extend_o<=0;
	end
		6'b000101:
	begin
		ALU_op_o  <=4;
		ALUSrc_o  <=0;
		RegWrite_o<=0;
	    RegDst_o  <=/*1'bx*/0;
	    Branch_o  <=1;
		ALU_extend_o<=0;
	end	
	
	
	endcase
end

//Main function

endmodule





                    
                    