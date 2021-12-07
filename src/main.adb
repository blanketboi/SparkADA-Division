pragma SPARK_Mode (On);
with AS_Io_Wrapper; use AS_Io_Wrapper;
with Divide;        use Divide;
with SPARK.Text_IO; use SPARK.Text_IO;

procedure Main is
   temp  : input;
   temp2 : input;
   X, Y  : Integer;
   Last  : Integer;
   N     : String (1 .. 2);

begin
   loop
      AS_Init_Standard_Output;
      AS_Init_Standard_Input;
      loop
         AS_Put_Line ("Please enter Dividend: ");
         AS_Get (X);
         exit when X in 0 .. 20000;
         AS_Put_Line ("Not valid");
      end loop;
      pragma Assert (X in 0 .. 20000);
      temp.Dividend := X;

      loop
         AS_Put_Line ("Please enter Divisor: ");
         AS_Get (Y);
         exit when Y in 1 .. 20000;
         AS_Put_Line ("Not valid");
      end loop;
      pragma Assert (Y in 1 .. 20000);
      temp.Divisor := Y;

      --Divide Function
      Divido (temp, temp2);

      AS_Put_Line ("");
      AS_Put ("Quotient:  ");
      AS_Put_Line (temp2.Divisor);
      AS_Put ("Remainder: ");
      AS_Put_Line (temp2.Dividend);

      --Try Again loop
      loop
         AS_Put_Line ("Press any key to try again. Type 'N' to exit");
         AS_Get_Line (N, Last);
         exit when Last > 0;
         AS_Put_Line ("Incorrect entry, Please enter 'Y' or 'N'");
      end loop;
      exit when N (1 .. 1) = "N";
   end loop;

end Main;
