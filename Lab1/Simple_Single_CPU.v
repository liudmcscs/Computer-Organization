//Subject:     CO project 1 - Simple Single CPU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
module Simple_Single_CPU(
        clk_i,
		rst_i
		);
		
//I/O port
input         clk_i;
input         rst_i;

//Internal Signles

reg [31:0]pc;
//Greate componentes
wire [31:0]pcadd;
wire[31:0] instr_o;
wire Mux_PC_Source_select;
wire[31:0] data_o_PC;
wire[31:0] pc_out_o;
wire [4:0]data_o_Mux_Write_Reg;
wire [31:0]Adder1_sum;
wire [31:0]result_o ;
wire [31:0] RSdata_o;
wire [31:0]RTdata_o;
wire [2:0]ALU_op_o;
wire [3:0]ALUCtrl_o;
wire[31:0]data_o_extend;
wire[31:0]data_o_Mux_ALUSrc;
wire[31:0]data_o_Shift_Left_Two_32;
wire[31:0]Adder2_sum;
wire[31:0]data_o_extend_shift;
wire[31:0]data_o_extendfinal;
ProgramCounter PC(
        .clk_i(clk_i),      
	    .rst_i (rst_i),     
	    .pc_in_i(data_o_PC) ,   
	    .pc_out_o(pc_out_o) 
	    );
	
Adder Adder1(
        .src1_i(pcadd),     
	    .src2_i(pc_out_o),     
	    .sum_o(Adder1_sum)    
	    );
	
Instr_Memory IM(
        .pc_addr_i(pc_out_o),  
	    .instr_o(instr_o)    
	    );

MUX_2to1 #(.size(5)) Mux_Write_Reg(
        .data0_i(instr_o[20:16]),
        .data1_i(instr_o[15:11]),
        .select_i(RegDst_o),
        .data_o(data_o_Mux_Write_Reg)
        );	
		
Reg_File RF(
        .clk_i(clk_i),      
	    .rst_i(rst_i) ,     
        .RSaddr_i(instr_o[25:21]) ,  
        .RTaddr_i(instr_o[20:16]) ,  
        .RDaddr_i(data_o_Mux_Write_Reg) ,  
        .RDdata_i(result_o)  , 
        .RegWrite_i (RegWrite_o),
        .RSdata_o(RSdata_o) ,  
        .RTdata_o(RTdata_o)   
        );
	
Decoder Decoder(
        .instr_op_i(instr_o[31:26]), 
	    .RegWrite_o(RegWrite_o), 
	    .ALU_op_o(ALU_op_o),   
	    .ALUSrc_o(ALUSrc_o),   
	    .RegDst_o(RegDst_o),   
		.Branch_o(Branch_o),
		.ALU_extend_o(ALU_extend_o)
	    );

ALU_Ctrl AC(
        .funct_i(instr_o[5:0]),   
        .ALUOp_i(ALU_op_o),   
        .ALUCtrl_o(ALUCtrl_o) 
        );
	
Sign_Extend SE(
        .data_i(instr_o[15:0]),
        .data_o(data_o_extend)
        );

MUX_2to1 #(.size(32)) Mux_ALUSrc(
        .data0_i(RTdata_o),
        .data1_i(data_o_extendfinal),
        .select_i(ALUSrc_o),
        .data_o(data_o_Mux_ALUSrc)
        );	
		
ALU ALU(
		.src3_i(data_o_extendfinal),
        .src1_i(RSdata_o),
	    .src2_i(data_o_Mux_ALUSrc),
	    .ctrl_i(ALUCtrl_o),
	    .result_o(result_o),
		.zero_o(zero_o)
	    );
		
Adder Adder2(
        .src1_i(Adder1_sum),     
	    .src2_i(data_o_Shift_Left_Two_32),     
	    .sum_o(Adder2_sum)      
	    );
		
Shift_Left_Two_32 Shifter(
        .data_i(data_o_extend),
        .data_o(data_o_Shift_Left_Two_32)
        ); 		
		
MUX_2to1 #(.size(32)) Mux_PC_Source(
        .data0_i(Adder1_sum),
        .data1_i(Adder2_sum),
        .select_i(Mux_PC_Source_select),
        .data_o(data_o_PC)
        );	
Sign_Extend_shat Sign_Extend_shat(
        .data_i(instr_o[10:6]),
        .data_o(data_o_extend_shift)
        );		
MUX_2to1 #(.size(32)) Mux_Sign_Extend(
        .data0_i(data_o_extend),
        .data1_i(data_o_extend_shift),
        .select_i(ALU_extend_o),
        .data_o(data_o_extendfinal)
        );			
assign Mux_PC_Source_select=Branch_o&zero_o;
assign pcadd=4;
//assign Adder2_sum=Adder2_sum-4;
endmodule
		  


