--
--  Project Euler problem #2
--
--  Each new term in the Fibonacci sequence is generated by adding the previous
--  two terms. By starting with 1 and 2, the first 10 terms will be:
--
--  1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
--
--  By considering the terms in the Fibonacci sequence whose values do not
--  exceed four million, find the sum of the even-valued terms.

with Ada.Text_IO;

use Ada.Text_IO;

procedure Two is
    -- Upper bound of the Fibonacci sequence to consider
    Fib_Ceiling : constant Natural := 4_000_000;
    Fib_Previous : Natural := 0;
    Fib_Current : Natural := 1;
    Result  : Natural := 0;

    function Is_Even (Number : in Natural) return Boolean is
    begin
        if (Number mod 2) = 0 then
            return true;
        else
            return false;
        end if;
    end Is_Even;

begin
    while Fib_Current < Fib_Ceiling loop
        declare
            New_Value : Natural := Fib_Current + Fib_Previous;
        begin
            Fib_Previous := Fib_Current;
            Fib_Current := New_Value;

            if Is_Even (Fib_Current) then
                Result := (Result + Fib_Current);
            end if;
        end;
    end loop;

    Put_Line (Natural'Image (Result));
end Two;
