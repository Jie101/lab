`timescale 1ns/100ps

module read_file();

	integer data_file,i;
	reg [7:0] reg1;


	initial begin
		data_file = $fopen("hex_data3.txt","r");
	    i=0;

		while(! $feof(data_file)) begin
			#10;
			$fscanf(data_file,"%d",reg1);
			$display("i:%d %d\n",i,reg1);
			i=i+1;
		end
		
		$fclose(data_file);
	
	end



endmodule