//Subject:     CO project 2 - ALU Controller
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module ALU_Ctrl(
          funct_i,
          ALUOp_i,
          ALUCtrl_o
          );
          
//I/O ports 
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [4-1:0] ALUCtrl_o;    
     
//Internal Signals
reg        [4-1:0] ALUCtrl_o;
reg [3:0]ALUFunct_function;
always @(*)
	case (funct_i)

			6'b100001: ALUFunct_function <= 4'b0010;//2

			6'b100011: ALUFunct_function <= 4'b0110;//6

			6'b100100: ALUFunct_function <= 4'b0000;//0

			6'b100101: ALUFunct_function <= 4'b0001;//1

			6'b101010: ALUFunct_function <= 4'b0111;//7
			
			6'b000011: ALUFunct_function <= 4'b1000;//8

			6'b000111: ALUFunct_function <= 4'b1011;
			
			6'b011000: ALUFunct_function <= 4'b1111;//15
			
			default: ALUFunct_function <= 4'b0010;//2

	endcase
always @(*)

		case (ALUOp_i)

			3'b000: ALUCtrl_o <= 2;

			3'b001: ALUCtrl_o <= 6;

			3'b011: ALUCtrl_o <= 7;
			
			3'b100: ALUCtrl_o <= 10;
			
			3'b101: ALUCtrl_o <= 1;
			
			3'b110: ALUCtrl_o <= 9;
			
			3'b111: ALUCtrl_o <= 2;

			3'b010: ALUCtrl_o <= ALUFunct_function;

			default: ALUCtrl_o <= 2;

		endcase

endmodule     





                    
                    