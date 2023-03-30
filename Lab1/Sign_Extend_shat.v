//Subject:     CO project 1 - Sign extend
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Sign_Extend_shat(
    data_i,
    data_o
    );
               
//I/O ports
input   [5-1:0] data_i;
output  [32-1:0] data_o;

//Internal Signals
reg     [32-1:0] data_o;

//Sign extended
    always@(data_i)

begin
	data_o[4:0]  <= data_i[4:0];
	data_o[31:5] <= {27{1'b0}};
end      
endmodule      
     