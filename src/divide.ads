pragma SPARK_Mode;

package Divide is

   subtype PosInt is Integer range 0 .. Integer'Last;

   type input is record
      Dividend, Divisor : PosInt;
   end record;

   --O.Dividend = Remainder
   --O.Divisor = Quotient

   procedure Divido (R : in input; O : out input) with
      Depends => (O => R),
      Pre     => (R.Dividend in 0 .. 20000 and R.Divisor in 1 .. 20000),
      Post    =>
      ((O.Divisor * R.Divisor + O.Dividend = R.Dividend) and
       O.Dividend >= 0 and O.Dividend < R.Divisor);

end Divide;
