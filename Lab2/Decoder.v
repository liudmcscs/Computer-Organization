//Subject:     CO project 2 - Decoder
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
	MemToReg_o,
	BranchType_o,	
	Jump_o,	
	MemRead_i,		
	MemWrite_i	
	);
     
//I/O ports
input  [6-1:0] instr_op_i;
output         RegWrite_o;
output [3-1:0] ALU_op_o;
output         ALUSrc_o;
output         RegDst_o;
output         Branch_o;
output	[1:0]  MemToReg_o;
output		   BranchType_o;
output		   Jump_o;
output         MemRead_i;
output         MemWrite_i;
 
//Internal Signals
reg         RegWrite_o;
reg [3-1:0] ALU_op_o;
reg         ALUSrc_o;
reg         RegDst_o;
reg         Branch_o;
reg	[1:0]   MemToReg_o;
reg		    BranchType_o;
reg		    Jump_o;
reg         MemRead_i;
reg         MemWrite_i;   


//Parameter
always@(instr_op_i)
begin
	ALU_op_o<=0;
	ALUSrc_o<=0;
	RegWrite_o<=0;
	RegDst_o<=0;
	Branch_o<=0;
	MemToReg_o<=0;
	BranchType_o<=0;		
	Jump_o<=0;		
	MemRead_i<=0;		
	MemWrite_i<=0;	
	case (instr_op_i)
	6'b000000:
	begin
		ALU_op_o  <=2;
		ALUSrc_o  <=0;
		RegWrite_o<=1;
	    RegDst_o  <=1;
	    Branch_o  <=0;
		MemToReg_o<=0;
		BranchType_o<=0;
		Jump_o<=1;
		MemRead_i<=0;
		MemWrite_i<=0;
	end
	6'b001000:
	begin
		ALU_op_o  <=7;
		ALUSrc_o  <=1;
		RegWrite_o<=1;
	    RegDst_o  <=0;
	    Branch_o  <=0;
		MemToReg_o<=0;
		BranchType_o<=0;
		Jump_o<=1;
		MemRead_i<=0;
		MemWrite_i<=0;		
	end
		6'b001011:
	begin
		ALU_op_o  <=3;
		ALUSrc_o  <=1;
		RegWrite_o<=1;
	    RegDst_o  <=0;
	    Branch_o  <=0;
		MemToReg_o<=0;
		BranchType_o<=0;
		Jump_o<=1;
		MemRead_i<=0;
		MemWrite_i<=0;
	end
		6'b000100:
	begin
		ALU_op_o  <=1;
		ALUSrc_o  <=0;
		RegWrite_o<=0;
	    RegDst_o  <=0;
	    Branch_o  <=1;
		MemToReg_o<=0;
		BranchType_o<=0;
		Jump_o<=1;
		MemRead_i<=0;
		MemWrite_i<=0;
	end
		6'b001111:
	begin
		ALU_op_o  <=6;
		ALUSrc_o  <=1;
		RegWrite_o<=1;
	    RegDst_o  <=0;
	    Branch_o  <=0;
		MemToReg_o<=0;
		BranchType_o<=0;
		Jump_o<=1;
		MemRead_i<=0;
		MemWrite_i<=0;
	end
		6'b001101:
	begin
		ALU_op_o  <=5;
		ALUSrc_o  <=1;
		RegWrite_o<=1;
	    RegDst_o  <=0;
	    Branch_o  <=0;
		MemToReg_o<=0;
		BranchType_o<=0;
		Jump_o<=1;
		MemRead_i<=0;
		MemWrite_i<=0;
	end
		6'b000101:
	begin
		ALU_op_o  <=4;
		ALUSrc_o  <=0;
		RegWrite_o<=0;
	    RegDst_o  <=0;
	    Branch_o  <=1;
		MemToReg_o<=0;
		BranchType_o<=0;
		Jump_o<=1;
		MemRead_i<=0;
		MemWrite_i<=0;
	end	
		6'b000101:
	begin
		ALU_op_o  <=4;
		ALUSrc_o  <=0;
		RegWrite_o<=0;
	    RegDst_o  <=0;
	    Branch_o  <=1;
		MemToReg_o<=0;
		BranchType_o<=0;
		Jump_o<=1;
		MemRead_i<=0;
		MemWrite_i<=0;
	end		
	6'b001000:
	begin
		ALU_op_o  <=7;
		ALUSrc_o  <=1;
		RegWrite_o<=1;
	    RegDst_o  <=0;
	    Branch_o  <=0;
		MemToReg_o<=0;
		BranchType_o<=0;
		Jump_o<=1;
		MemRead_i<=0;
		MemWrite_i<=0;		
	end	
	6'b100011://lw
	begin
		ALU_op_o  <=2;
		ALUSrc_o  <=1;
		RegWrite_o<=1;
	    RegDst_o  <=0;
	    Branch_o  <=0;
		MemToReg_o<=1;
		BranchType_o<=0;
		Jump_o<=1;
		MemRead_i<=1;
		MemWrite_i<=0;		
	end	
	6'b101011://sw
	begin
		ALU_op_o  <=2;
		ALUSrc_o  <=1;
		RegWrite_o<=0;
	    RegDst_o  <=1;
	    Branch_o  <=0;
		MemToReg_o<=0;
		BranchType_o<=0;
		Jump_o<=1;
		MemRead_i<=0;
		MemWrite_i<=1;		
	end	
	6'b000010://jump
	begin
		ALU_op_o  <=1;
		ALUSrc_o  <=0;
		RegWrite_o<=0;
	    RegDst_o  <=0;
	    Branch_o  <=1;
		MemToReg_o<=0;
		BranchType_o<=1;
		Jump_o<=0;
		MemRead_i<=0;
		MemWrite_i<=0;		
	end	
	endcase	
end


endmodule





                    
                    