pragma SPARK_Mode;

package body Divide is

   procedure Divido (R : in input; O : out input) is
      Quotient  : Integer := 0;
      Remainder : Integer := R.Dividend;
      Divdend   : Integer := R.Dividend;
      Divisor   : Integer := R.Divisor;

   begin
      if Divisor > 0 then
         loop
            exit when Remainder < Divisor;
            pragma Loop_Invariant
              ((Divdend = Quotient * Divisor + Remainder) and
               (Remainder >= Divisor));
            Remainder := Remainder - Divisor;
            Quotient  := Quotient + 1;
         end loop;
      end if;

      O.Divisor  := Quotient;
      O.Dividend := Remainder;
   end Divido;
end Divide;
